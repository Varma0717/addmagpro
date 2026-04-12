<?php

use App\Http\Controllers\Api\V1\AuthController;
use App\Http\Controllers\Api\V1\CatalogController;
use App\Http\Controllers\Api\V1\NotificationController;
use App\Http\Controllers\Api\V1\OrderController;
use App\Http\Controllers\Api\V1\ProfileController;
use App\Http\Controllers\Api\V1\ReferralController;
use App\Http\Controllers\Api\V1\WalletController;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function (): void {
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

        Route::get('/account/orders', [OrderController::class, 'index']);
        Route::get('/account/orders/{order}', [OrderController::class, 'show']);
    });

    Route::get('/categories', [CatalogController::class, 'categories']);
    Route::get('/products', [CatalogController::class, 'products']);
    Route::get('/products/{slug}', [CatalogController::class, 'productShow']);
    Route::get('/listings', [CatalogController::class, 'listings']);
    Route::get('/listings/{slug}', [CatalogController::class, 'listingShow']);
    Route::get('/search', [CatalogController::class, 'search'])->middleware('throttle:60,1');
});
