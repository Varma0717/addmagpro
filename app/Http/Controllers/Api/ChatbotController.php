<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ChatbotInteraction;
use App\Models\Coupon;
use App\Models\Product;
use App\Models\ServiceListing;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Throwable;

class ChatbotController extends Controller
{
    public function suggestions(Request $request): JsonResponse
    {
        $payload = $request->validate([
            'intent' => ['required', 'string', 'in:find_nearby_services,best_deals_today'],
            'query' => ['nullable', 'string', 'max:255'],
            'city' => ['nullable', 'string', 'max:120'],
        ]);

        $intent = $payload['intent'];
        $ruleBased = $this->ruleBasedSuggestions($intent, $payload);

        $aiResult = $this->tryAiProvider($intent, $payload, $ruleBased);

        $suggestions = $aiResult['suggestions'] ?? $ruleBased;
        $provider = $aiResult['provider'] ?? 'rules';
        $fallbackUsed = $provider !== 'ai';

        ChatbotInteraction::create([
            'user_id' => $request->user()?->id,
            'session_id' => $request->hasSession() ? $request->session()->getId() : $request->cookie('laravel_session'),
            'event_type' => 'suggestion_request',
            'intent' => $intent,
            'query' => $payload['query'] ?? null,
            'provider' => $provider,
            'fallback_used' => $fallbackUsed,
            'response_count' => count($suggestions),
            'meta' => ['city' => $payload['city'] ?? null],
            'ip_address' => $request->ip(),
            'user_agent' => $request->userAgent(),
        ]);

        return response()->json([
            'intent' => $intent,
            'source' => $provider,
            'fallback_used' => $fallbackUsed,
            'suggestions' => $suggestions,
        ]);
    }

    public function track(Request $request): JsonResponse
    {
        $payload = $request->validate([
            'event_type' => ['required', 'string', 'in:widget_opened,intent_selected,suggestion_clicked'],
            'intent' => ['nullable', 'string', 'max:120'],
            'query' => ['nullable', 'string', 'max:255'],
            'meta' => ['nullable', 'array'],
        ]);

        ChatbotInteraction::create([
            'user_id' => $request->user()?->id,
            'session_id' => $request->hasSession() ? $request->session()->getId() : $request->cookie('laravel_session'),
            'event_type' => $payload['event_type'],
            'intent' => $payload['intent'] ?? null,
            'query' => $payload['query'] ?? null,
            'provider' => 'client',
            'fallback_used' => false,
            'response_count' => 0,
            'meta' => $payload['meta'] ?? null,
            'ip_address' => $request->ip(),
            'user_agent' => $request->userAgent(),
        ]);

        return response()->json(['ok' => true]);
    }

    private function ruleBasedSuggestions(string $intent, array $payload): array
    {
        if ($intent === 'find_nearby_services') {
            $query = ServiceListing::query()
                ->approved()
                ->with('category:id,name')
                ->select(['id', 'business_name', 'slug', 'city', 'phone', 'category_id'])
                ->when($payload['city'] ?? null, fn ($q, $city) => $q->where('city', 'like', '%' . $city . '%'))
                ->orderByDesc('is_featured')
                ->latest()
                ->limit(5)
                ->get();

            return $query->map(fn (ServiceListing $listing): array => [
                'type' => 'service',
                'title' => $listing->business_name,
                'subtitle' => trim(($listing->category?->name ?? 'Service') . ($listing->city ? ' • ' . $listing->city : '')),
                'cta' => 'View listing',
                'url' => url('/listings/' . $listing->slug),
            ])->all();
        }

        $products = Product::query()
            ->active()
            ->whereNotNull('discount_price')
            ->whereColumn('discount_price', '<', 'price')
            ->select(['id', 'name', 'slug', 'price', 'discount_price'])
            ->orderByRaw('((price - discount_price) / NULLIF(price, 0)) DESC')
            ->limit(4)
            ->get();

        $productSuggestions = $products->map(fn (Product $product): array => [
            'type' => 'product',
            'title' => $product->name,
            'subtitle' => 'Now ₹' . number_format((float) $product->discount_price, 2) . ' (MRP ₹' . number_format((float) $product->price, 2) . ')',
            'cta' => 'Shop now',
            'url' => url('/products/' . $product->slug),
        ])->all();

        $couponSuggestions = Coupon::query()
            ->where('is_active', true)
            ->where(function ($q) {
                $q->whereNull('expires_at')->orWhere('expires_at', '>=', now());
            })
            ->latest()
            ->limit(2)
            ->get(['code', 'name', 'type', 'value'])
            ->map(fn (Coupon $coupon): array => [
                'type' => 'offer',
                'title' => $coupon->name,
                'subtitle' => 'Code ' . $coupon->code . ' • ' . ($coupon->type === 'percentage' ? rtrim(rtrim((string) $coupon->value, '0'), '.') . '% off' : '₹' . number_format((float) $coupon->value, 2) . ' off'),
                'cta' => 'Apply at checkout',
                'url' => url('/cart'),
            ])->all();

        return array_values(array_merge($productSuggestions, $couponSuggestions));
    }

    private function tryAiProvider(string $intent, array $payload, array $fallback): ?array
    {
        $enabled = (bool) config('services.ai_assistant.enabled');
        $endpoint = (string) config('services.ai_assistant.endpoint');
        $apiKey = (string) config('services.ai_assistant.api_key');

        if (!$enabled || !$endpoint || !$apiKey) {
            return null;
        }

        try {
            $response = Http::timeout(2)
                ->acceptJson()
                ->withToken($apiKey)
                ->post($endpoint, [
                    'intent' => $intent,
                    'query' => $payload['query'] ?? null,
                    'city' => $payload['city'] ?? null,
                    'fallback' => $fallback,
                ]);

            if (!$response->ok()) {
                return null;
            }

            $data = $response->json();
            $suggestions = is_array($data['suggestions'] ?? null) ? $data['suggestions'] : null;

            if (!$suggestions) {
                return null;
            }

            return [
                'provider' => 'ai',
                'suggestions' => array_slice($suggestions, 0, 6),
            ];
        } catch (Throwable) {
            return null;
        }
    }
}
