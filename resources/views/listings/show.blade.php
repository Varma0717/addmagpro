@extends('layouts.app')
@section('title', $listing->business_name)

@section('content')
<div class="flex items-center gap-2 text-sm text-gray-500 mb-6">
    <a href="{{ route('home') }}" class="hover:text-orange-500">Home</a>
    <span>/</span>
    <a href="{{ route('categories.show', $listing->category->slug) }}" class="hover:text-orange-500">{{ $listing->category->name }}</a>
    <span>/</span>
    <span class="text-gray-800">{{ $listing->business_name }}</span>
</div>

<div class="grid md:grid-cols-3 gap-8 mb-10">
    <!-- Main info -->
    <div class="md:col-span-2">
        @if($listing->images->count())
        <div class="grid grid-cols-3 gap-2 mb-6">
            @foreach($listing->images->take(6) as $img)
            <img src="{{ Storage::url($img->image_path) }}" class="rounded-xl object-cover aspect-video w-full">
            @endforeach
        </div>
        @endif

        <h1 class="text-2xl font-bold text-gray-900 mb-2">{{ $listing->business_name }}</h1>
        <p class="text-gray-500 mb-4">{{ $listing->category->name }} &bull; {{ $listing->city }}, {{ $listing->state }}</p>

        @if($listing->reviews->count())
        <div class="flex items-center gap-2 mb-4">
            <div class="flex text-yellow-400">
                @for($i = 1; $i <= 5; $i++)
                    <span>{{ $i <= round($listing->reviews->avg('rating')) ? '★' : '☆' }}</span>
                    @endfor
            </div>
            <span class="text-sm font-medium">{{ number_format($listing->reviews->avg('rating'), 1) }}</span>
            <span class="text-sm text-gray-400">({{ $listing->reviews->count() }} reviews)</span>
        </div>
        @endif

        <div class="bg-white rounded-xl border p-5 mb-6">
            <h2 class="font-semibold text-gray-700 mb-3">About</h2>
            <p class="text-gray-600 leading-relaxed">{{ $listing->description }}</p>
        </div>

        <!-- Reviews section -->
        <h2 class="text-lg font-bold text-gray-800 mb-4">Reviews</h2>

        @auth
        <form method="POST" action="{{ route('listings.review', $listing->slug) }}" class="bg-white rounded-xl border p-5 mb-5">
            @csrf
            <div class="flex gap-2 mb-3" x-data="{ rating: 0 }">
                @for($i = 1; $i <= 5; $i++)
                    <button type="button" @click="rating = {{ $i }}"
                    :class="rating >= {{ $i }} ? 'text-yellow-400' : 'text-gray-300'"
                    class="text-2xl">★</button>
                    <input type="hidden" name="rating" :value="rating">
                    @endfor
            </div>
            <textarea name="comment" rows="2" placeholder="Share your experience…"
                class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400 mb-3"></textarea>
            <button class="px-5 py-2 bg-orange-500 text-white rounded-lg text-sm">Submit</button>
        </form>
        @endauth

        <div class="space-y-3">
            @forelse($listing->reviews as $review)
            <div class="bg-white rounded-xl border p-4">
                <div class="flex items-center gap-3 mb-2">
                    <div class="w-8 h-8 rounded-full bg-orange-100 text-orange-600 font-bold text-sm flex items-center justify-center">
                        {{ strtoupper(substr($review->user->name ?? 'U', 0, 1)) }}
                    </div>
                    <div>
                        <p class="text-sm font-medium">{{ $review->user->name ?? 'User' }}</p>
                        <div class="text-yellow-400 text-xs">{{ str_repeat('★', $review->rating) }}{{ str_repeat('☆', 5 - $review->rating) }}</div>
                    </div>
                    <span class="ml-auto text-xs text-gray-400">{{ $review->created_at->diffForHumans() }}</span>
                </div>
                <p class="text-sm text-gray-600">{{ $review->comment }}</p>
            </div>
            @empty
            <p class="text-gray-400 text-sm">No reviews yet.</p>
            @endforelse
        </div>
    </div>

    <!-- Contact sidebar -->
    <div class="space-y-4">
        <div class="bg-white rounded-xl border p-5">
            <h3 class="font-semibold text-gray-700 mb-4">Contact</h3>
            @if($listing->phone)
            <a href="tel:{{ $listing->phone }}"
                class="flex items-center gap-3 w-full py-3 bg-green-500 text-white rounded-xl font-medium justify-center hover:bg-green-600 mb-3">
                📞 Call {{ $listing->phone }}
            </a>
            <a href="https://wa.me/91{{ preg_replace('/\D/', '', $listing->phone) }}?text={{ urlencode('Hi! I found your business on AdMagPro: '.$listing->business_name) }}"
                target="_blank"
                class="flex items-center gap-3 w-full py-3 bg-green-600 text-white rounded-xl font-medium justify-center hover:bg-green-700 mb-3">
                WhatsApp
            </a>
            @endif
            @if($listing->email)
            <a href="mailto:{{ $listing->email }}" class="block text-center py-3 border border-gray-300 rounded-xl text-sm hover:bg-gray-50">
                ✉️ {{ $listing->email }}
            </a>
            @endif
        </div>

        <div class="bg-white rounded-xl border p-5 text-sm space-y-2">
            <h3 class="font-semibold text-gray-700 mb-3">Address</h3>
            <p class="text-gray-600">{{ $listing->address }}</p>
            <p class="text-gray-600">{{ $listing->city }}, {{ $listing->state }} {{ $listing->pincode }}</p>
            @if($listing->website)
            <a href="{{ $listing->website }}" target="_blank" class="text-orange-500 hover:underline break-all">{{ $listing->website }}</a>
            @endif
        </div>
    </div>
</div>
@endsection