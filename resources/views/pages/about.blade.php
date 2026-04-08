@extends('layouts.app')
@section('title', 'About Us')

@section('content')
<div class="max-w-4xl mx-auto">
    <nav class="flex items-center gap-2 text-sm text-surface-400 mb-6">
        <a href="{{ route('home') }}" class="hover:text-brand-500">Home</a>
        <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5"/></svg>
        <span class="text-surface-600">About Us</span>
    </nav>

    <div class="bg-white rounded-2xl shadow-soft border border-surface-100 p-8 md:p-12">
        <h1 class="font-display text-3xl font-bold text-surface-900 mb-6">About Us</h1>

        <div class="prose prose-surface max-w-none text-surface-600 leading-relaxed space-y-4">
            <p>We are delighted to introduce you to <strong>Add Mag Pro</strong>, a leading E-commerce and Local Search Engine platform designed to help businesses like yours reach a broader audience and grow your customer base.</p>

            <p>Our website features a wide array of product categories including clothes, electronics, groceries, electric vehicles and more, along with service categories, offering a one-stop shop for consumers and a lucrative marketplace for vendors.</p>

            <h2 class="font-display text-xl font-semibold text-surface-800 mt-8 mb-3">Our Mission</h2>
            <p>To empower local businesses by providing a powerful digital platform that connects them with customers in their area and beyond. We strive to make online commerce accessible, affordable, and rewarding for everyone.</p>

            <h2 class="font-display text-xl font-semibold text-surface-800 mt-8 mb-3">What We Offer</h2>
            <ul class="list-disc pl-6 space-y-2">
                <li><strong>Products Marketplace</strong> — Browse and purchase from a wide range of product categories with cashback rewards.</li>
                <li><strong>Stores & Services</strong> — Discover local service providers, vendors, and businesses in your area.</li>
                <li><strong>Classifieds</strong> — Post and find classified ads for buying, selling, and services.</li>
                <li><strong>Wallet & Rewards</strong> — Earn cashback, referral bonuses, and wallet credits on every transaction.</li>
                <li><strong>Vendor Registration</strong> — Register your business and reach thousands of customers through our platform.</li>
            </ul>

            <h2 class="font-display text-xl font-semibold text-surface-800 mt-8 mb-3">Company Information</h2>
            <p><strong>KOOCHANA PUBLICATIONS PRIVATE LIMITED</strong></p>
            <p>
                N YUGENDHERINI, BUILDING NO-8-3-940, 8-3-940/A,<br>
                YELLAREDDY GUDA, HYDERABAD<br>
                Hyderabad, TG 500038
            </p>
        </div>
    </div>
</div>
@endsection
