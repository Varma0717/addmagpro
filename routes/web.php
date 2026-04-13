<?php

use App\Http\Controllers\Account;
use App\Http\Controllers\Admin;
use App\Http\Controllers\AdController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ListingController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\SearchController;
use Illuminate\Support\Facades\Route;

// Public routes
Route::get('/', [HomeController::class, 'index'])->name('home');
Route::post('/set-location', [HomeController::class, 'setLocation'])->name('set-location');
Route::get('/search', [SearchController::class, 'index'])->name('search');
Route::get('/categories', [CategoryController::class, 'index'])->name('categories.index');
Route::get('/stores', [CategoryController::class, 'stores'])->name('categories.stores');
Route::get('/services', [CategoryController::class, 'servicesDirectory'])->name('categories.services');
Route::get('/category/{category:slug}', [CategoryController::class, 'show'])->name('categories.show');
Route::get('/product/{product:slug}', [ProductController::class, 'show'])->name('products.show');
Route::get('/listing/{listing:slug}', [ListingController::class, 'show'])->name('listings.show');
Route::get('/ads/{ad}/click', [AdController::class, 'click'])->name('ads.click');

// Static pages
Route::get('/about', [PageController::class, 'about'])->name('pages.about');
Route::get('/contact', [PageController::class, 'contact'])->name('pages.contact');
Route::get('/privacy-policy', [PageController::class, 'privacy'])->name('pages.privacy');
Route::get('/terms', [PageController::class, 'terms'])->name('pages.terms');
Route::get('/shipping-policy', [PageController::class, 'shipping'])->name('pages.shipping');
Route::get('/refund-policy', [PageController::class, 'refund'])->name('pages.refund');

// Auth + product/listing review routes (auth required)
Route::middleware('auth')->group(function () {
    Route::post('/product/{product:slug}/review', [ProductController::class, 'review'])->name('products.review');
    Route::post('/listing/{listing:slug}/review', [ListingController::class, 'review'])->name('listings.review');
});

// Cart (auth required)
Route::middleware('auth')->prefix('cart')->name('cart.')->group(function () {
    Route::get('/', [CartController::class, 'index'])->name('index');
    Route::post('/add', [CartController::class, 'add'])->name('add');
    Route::patch('/{item}', [CartController::class, 'update'])->name('update');
    Route::delete('/{item}', [CartController::class, 'remove'])->name('remove');
    Route::post('/validate-coupon', [CartController::class, 'validateCoupon'])->name('validate-coupon');
});

// Checkout (auth required)
Route::middleware('auth')->prefix('checkout')->name('checkout.')->group(function () {
    Route::get('/', [CheckoutController::class, 'index'])->name('index');
    Route::post('/razorpay/create', [CheckoutController::class, 'createRazorpayOrder'])->name('razorpay.create');
    Route::post('/place-order', [CheckoutController::class, 'placeOrder'])->name('place-order');
    Route::get('/confirmation/{order}', [CheckoutController::class, 'confirmation'])->name('confirmation');
});

// Account panel (auth required)
Route::middleware('auth')->prefix('account')->name('account.')->group(function () {
    Route::get('/', [Account\ExecutiveController::class, 'dashboard'])->name('index');
    Route::get('/coupons', [Account\CouponController::class, 'index'])->name('coupons.index');
    Route::post('/coupons/generate', [Account\CouponController::class, 'store'])->name('coupons.store');
    Route::get('/generate-coupons', fn() => redirect()->route('account.coupons.index'));
    Route::get('/team-details', [Account\ExecutiveController::class, 'teamDetails'])->name('team.index');
    Route::get('/discount-shop-orders', [Account\ExecutiveController::class, 'discountShopOrders'])->name('discount-orders.index');
    Route::get('/discount-customer-payments', [Account\ExecutiveController::class, 'discountStoreCustomerPayments'])->name('discount-payments.index');
    Route::post('/withdraw', [Account\ExecutiveController::class, 'requestWithdraw'])->name('withdraw.store');
    Route::get('/transactions', [Account\WalletController::class, 'transactions'])->name('transactions.index');
    Route::get('/settings', [Account\SettingsController::class, 'index'])->name('settings.index');
    Route::get('/support', [Account\SupportController::class, 'index'])->name('support.index');
    Route::get('/profile', [Account\ProfileController::class, 'edit'])->name('profile.edit');
    Route::post('/profile', [Account\ProfileController::class, 'update'])->name('profile.update');
    Route::get('/orders', [Account\OrderController::class, 'index'])->name('orders.index');
    Route::get('/orders/{order}', [Account\OrderController::class, 'show'])->name('orders.show');
    Route::get('/wallet', [Account\WalletController::class, 'index'])->name('wallet.index');
    Route::post('/wallet/topup/create', [Account\WalletController::class, 'createTopup'])->name('wallet.topup.create');
    Route::post('/wallet/topup/verify', [Account\WalletController::class, 'verifyTopup'])->name('wallet.topup.verify');
    Route::get('/wishlist', [Account\WishlistController::class, 'index'])->name('wishlist.index');
    Route::post('/wishlist/toggle', [Account\WishlistController::class, 'toggle'])->name('wishlist.toggle');
    Route::get('/referrals', [Account\ReferralController::class, 'index'])->name('referrals.index');
    Route::get('/notifications', [Account\NotificationController::class, 'index'])->name('notifications.index');
    Route::get('/notifications/count', [Account\NotificationController::class, 'unreadCount'])->name('notifications.count');
    Route::get('/settings', [Account\SettingsController::class, 'edit'])->name('settings.edit');
    Route::post('/settings', [Account\SettingsController::class, 'update'])->name('settings.update');
});

// Dashboard redirect (Breeze default)
Route::get('/dashboard', fn() => redirect()->route('account.index'))
    ->middleware(['auth', 'verified'])->name('dashboard');

// Admin routes
Route::middleware(['auth', 'admin'])->prefix('admin')->name('admin.')->group(function () {
    Route::get('/', [Admin\DashboardController::class, 'index'])->name('dashboard');

    // Users
    Route::get('/users', [Admin\UserController::class, 'index'])->name('users.index');
    Route::get('/users/{user}', [Admin\UserController::class, 'show'])->name('users.show');
    Route::post('/users/{user}/toggle', [Admin\UserController::class, 'toggleActive'])->name('users.toggle');

    // Categories
    Route::resource('categories', Admin\CategoryController::class)->names('categories');

    // Products
    Route::resource('products', Admin\ProductController::class)->names('products');
    Route::delete('/products/images/{image}', [Admin\ProductController::class, 'destroyImage'])->name('products.images.destroy');

    // Listings
    Route::get('/listings', [Admin\ListingController::class, 'index'])->name('listings.index');
    Route::get('/listings/{listing}', [Admin\ListingController::class, 'show'])->name('listings.show');
    Route::post('/listings/{listing}/approve', [Admin\ListingController::class, 'approve'])->name('listings.approve');
    Route::post('/listings/{listing}/reject', [Admin\ListingController::class, 'reject'])->name('listings.reject');
    Route::delete('/listings/{listing}', [Admin\ListingController::class, 'destroy'])->name('listings.destroy');

    // Orders
    Route::get('/orders', [Admin\OrderController::class, 'index'])->name('orders.index');
    Route::get('/orders/{order}', [Admin\OrderController::class, 'show'])->name('orders.show');
    Route::post('/orders/{order}/status', [Admin\OrderController::class, 'updateStatus'])->name('orders.status');

    // Wallet
    Route::get('/wallet', [Admin\WalletController::class, 'index'])->name('wallet.index');
    Route::post('/wallet/credit', [Admin\WalletController::class, 'credit'])->name('wallet.credit');

    // Referrals
    Route::get('/referrals', [Admin\ReferralController::class, 'index'])->name('referrals.index');
    Route::post('/referrals/settings', [Admin\ReferralController::class, 'updateSettings'])->name('referrals.settings');

    // Banners
    Route::resource('banners', Admin\BannerController::class)->names('banners');

    // Coupons
    Route::resource('coupons', Admin\CouponController::class)->names('coupons');

    // Notifications
    Route::get('/notifications', [Admin\NotificationController::class, 'index'])->name('notifications.index');
    Route::post('/notifications/send', [Admin\NotificationController::class, 'send'])->name('notifications.send');
});

require __DIR__ . '/auth.php';
