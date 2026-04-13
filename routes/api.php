<?php

use App\Http\Controllers\Api\V1\AdsController;
use App\Http\Controllers\Api\V1\AuthController;
use App\Http\Controllers\Api\V1\CartController;
use App\Http\Controllers\Api\V1\CatalogController;
use App\Http\Controllers\Api\V1\CheckoutController;
use App\Http\Controllers\Api\V1\DeviceTokenController;
use App\Http\Controllers\Api\V1\NotificationController;
use App\Http\Controllers\Api\V1\OrderController;
use App\Http\Controllers\Api\V1\ProfileController;
use App\Http\Controllers\Api\V1\ReferralController;
use App\Http\Controllers\Api\V1\WalletController;
use App\Http\Controllers\Api\ChatbotController;
use App\Http\Controllers\Api\V1\WishlistController as ApiWishlistController;
use App\Models\District;
use App\Models\State;
use Illuminate\Support\Facades\Route;

// Public helper: districts by state (used by location picker)
Route::get('/districts/{stateId}', function (int $stateId) {
    return [
        'data' => District::where('state_id', $stateId)->orderBy('district_name')->get(['id', 'district_name']),
    ];
});

Route::prefix('chatbot')->middleware('throttle:60,1')->group(function (): void {
    Route::post('/suggestions', [ChatbotController::class, 'suggestions']);
    Route::post('/track', [ChatbotController::class, 'track']);
});

Route::prefix('v1')->group(function (): void {
    Route::get('/states', function () {
        return [
            'data' => State::query()
                ->orderBy('state_name')
                ->get(['id', 'state_name']),
        ];
    });

    Route::get('/districts/{stateId}', function (int $stateId) {
        return [
            'data' => District::where('state_id', $stateId)->orderBy('district_name')->get(['id', 'district_name']),
        ];
    });

    Route::prefix('auth')->group(function (): void {
        Route::post('/register', [AuthController::class, 'register'])->middleware('throttle:10,1');
        Route::post('/login', [AuthController::class, 'login'])->middleware('throttle:20,1');

        Route::middleware('auth:sanctum')->group(function (): void {
            Route::post('/logout', [AuthController::class, 'logout']);
            Route::post('/logout-all', [AuthController::class, 'logoutAll']);
        });
    });

    Route::middleware('auth:sanctum')->group(function (): void {
        Route::get('/me', [ProfileController::class, 'show']);
        Route::post('/account/profile', [ProfileController::class, 'update']);

        Route::get('/account/referrals', [ReferralController::class, 'index']);
        Route::get('/account/referrals/team', [ReferralController::class, 'team']);

        Route::get('/account/wallet', [WalletController::class, 'show']);
        Route::post('/account/wallet/topup/create', [WalletController::class, 'createTopup']);
        Route::post('/account/wallet/topup/verify', [WalletController::class, 'verifyTopup']);
        Route::get('/account/withdraw-requests', [WalletController::class, 'withdrawRequests']);
        Route::post('/account/withdraw-requests', [WalletController::class, 'storeWithdrawRequest']);

        Route::get('/account/notifications', [NotificationController::class, 'index']);
        Route::get('/account/notifications/unread-count', [NotificationController::class, 'unreadCount']);
        Route::patch('/account/notifications/{notification}/read', [NotificationController::class, 'markRead']);

        Route::get('/account/location', [LocationPreferenceController::class, 'show']);
        Route::post('/account/location', [LocationPreferenceController::class, 'update']);

        Route::get('/account/orders', [OrderController::class, 'index']);
        Route::get('/account/orders/{order}', [OrderController::class, 'show']);

        Route::get('/account/cart', [CartController::class, 'index']);
        Route::post('/account/cart/items', [CartController::class, 'store']);
        Route::patch('/account/cart/items/{item}', [CartController::class, 'update']);
        Route::delete('/account/cart/items/{item}', [CartController::class, 'destroy']);
        Route::post('/account/cart/coupon/validate', [CartController::class, 'validateCoupon']);

        Route::post('/account/checkout/razorpay/create', [CheckoutController::class, 'createRazorpayOrder']);
        Route::post('/account/checkout/place-order', [CheckoutController::class, 'placeOrder']);

        Route::get('/account/wishlist', [ApiWishlistController::class, 'index']);
        Route::post('/account/wishlist/toggle', [ApiWishlistController::class, 'toggle']);
        Route::get('/account/wishlist/check', [ApiWishlistController::class, 'check']);

        Route::post('/account/device-tokens', [DeviceTokenController::class, 'upsert']);
        Route::delete('/account/device-tokens', [DeviceTokenController::class, 'destroy']);
    });

    Route::get('/ads/{placement}', [AdsController::class, 'index'])->whereIn('placement', ['home', 'category', 'product']);
    Route::post('/ads/{ad}/click', [AdsController::class, 'click'])->name('api.v1.ads.click');

    Route::get('/categories', [CatalogController::class, 'categories']);
    Route::get('/home', [CatalogController::class, 'home']);
    Route::get('/products', [CatalogController::class, 'products']);
    Route::get('/products/{slug}', [CatalogController::class, 'productShow']);
    Route::get('/listings', [CatalogController::class, 'listings']);
    Route::get('/listings/{slug}', [CatalogController::class, 'listingShow']);
    Route::get('/search', [CatalogController::class, 'search'])->middleware('throttle:60,1');
    Route::get('/search/mixed', [CatalogController::class, 'searchMixed'])->middleware('throttle:60,1');
});
