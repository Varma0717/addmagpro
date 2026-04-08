@extends('layouts.app')
@section('title', 'Privacy Policy')

@section('content')
<div class="max-w-4xl mx-auto">
    <nav class="flex items-center gap-2 text-sm text-surface-400 mb-6">
        <a href="{{ route('home') }}" class="hover:text-brand-500">Home</a>
        <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5"/></svg>
        <span class="text-surface-600">Privacy Policy</span>
    </nav>

    <div class="bg-white rounded-2xl shadow-soft border border-surface-100 p-8 md:p-12">
        <h1 class="font-display text-3xl font-bold text-surface-900 mb-2">Privacy Policy</h1>
        <p class="text-surface-400 text-sm mb-8">Last updated on Jun 05th, 2024</p>

        <div class="prose prose-surface max-w-none text-surface-600 leading-relaxed space-y-4">
            <p>This privacy policy sets out how KOOCHANA PUBLICATIONS PRIVATE LIMITED uses and protects any information that you give KOOCHANA PUBLICATIONS PRIVATE LIMITED when you use this website.</p>

            <p>KOOCHANA PUBLICATIONS PRIVATE LIMITED is committed to ensuring that your privacy is protected. Should we ask you to provide certain information by which you can be identified when using this website, then you can be assured that it will only be used in accordance with this privacy statement.</p>

            <p>KOOCHANA PUBLICATIONS PRIVATE LIMITED may change this policy from time to time by updating this page. You should check this page from time to time to ensure that you are happy with any changes.</p>

            <h2 class="font-display text-xl font-semibold text-surface-800 mt-8 mb-3">Information We Collect</h2>
            <p>We may collect the following information:</p>
            <ul class="list-disc pl-6 space-y-1">
                <li>Name and job title</li>
                <li>Contact information including email address</li>
                <li>Demographic information such as postcode, preferences and interests</li>
                <li>Other information relevant to customer surveys and/or offers</li>
            </ul>

            <h2 class="font-display text-xl font-semibold text-surface-800 mt-8 mb-3">What We Do With the Information We Gather</h2>
            <p>We require this information to understand your needs and provide you with a better service, and in particular for the following reasons:</p>
            <ul class="list-disc pl-6 space-y-1">
                <li>Internal record keeping.</li>
                <li>We may use the information to improve our products and services.</li>
                <li>We may periodically send promotional emails about new products, special offers or other information which we think you may find interesting using the email address which you have provided.</li>
                <li>From time to time, we may also use your information to contact you for market research purposes. We may contact you by email, phone, fax or mail. We may use the information to customise the website according to your interests.</li>
            </ul>

            <h2 class="font-display text-xl font-semibold text-surface-800 mt-8 mb-3">Security</h2>
            <p>We are committed to ensuring that your information is secure. In order to prevent unauthorised access or disclosure we have put in suitable measures.</p>

            <h2 class="font-display text-xl font-semibold text-surface-800 mt-8 mb-3">How We Use Cookies</h2>
            <p>A cookie is a small file which asks permission to be placed on your computer's hard drive. Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit a particular site. Cookies allow web applications to respond to you as an individual. The web application can tailor its operations to your needs, likes and dislikes by gathering and remembering information about your preferences.</p>

            <p>We use traffic log cookies to identify which pages are being used. This helps us analyse data about webpage traffic and improve our website in order to tailor it to customer needs. We only use this information for statistical analysis purposes and then the data is removed from the system.</p>

            <p>Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find useful and which you do not. A cookie in no way gives us access to your computer or any information about you, other than the data you choose to share with us.</p>

            <p>You can choose to accept or decline cookies. Most web browsers automatically accept cookies, but you can usually modify your browser setting to decline cookies if you prefer. This may prevent you from taking full advantage of the website.</p>

            <h2 class="font-display text-xl font-semibold text-surface-800 mt-8 mb-3">Controlling Your Personal Information</h2>
            <p>You may choose to restrict the collection or use of your personal information in the following ways:</p>
            <ul class="list-disc pl-6 space-y-1">
                <li>Whenever you are asked to fill in a form on the website, look for the box that you can click to indicate that you do not want the information to be used by anybody for direct marketing purposes.</li>
                <li>If you have previously agreed to us using your personal information for direct marketing purposes, you may change your mind at any time by writing to or emailing us at <a href="mailto:support@addmagpro.com" class="text-brand-500 hover:text-brand-600">support@addmagpro.com</a>.</li>
            </ul>

            <p>We will not sell, distribute or lease your personal information to third parties unless we have your permission or are required by law to do so. We may use your personal information to send you promotional information about third parties which we think you may find interesting if you tell us that you wish this to happen.</p>

            <p>If you believe that any information we are holding on you is incorrect or incomplete, please write to or email us as soon as possible at the above address. We will promptly correct any information found to be incorrect.</p>
        </div>
    </div>
</div>
@endsection
