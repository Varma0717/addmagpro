@extends('layouts.app')
@section('title', 'Terms & Conditions')

@section('content')
<div class="max-w-4xl mx-auto">
    <nav class="flex items-center gap-2 text-sm text-surface-400 mb-6">
        <a href="{{ route('home') }}" class="hover:text-brand-500">Home</a>
        <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5"/></svg>
        <span class="text-surface-600">Terms & Conditions</span>
    </nav>

    <div class="bg-white rounded-2xl shadow-soft border border-surface-100 p-8 md:p-12">
        <h1 class="font-display text-3xl font-bold text-surface-900 mb-2">Terms and Conditions</h1>
        <p class="text-surface-400 text-sm mb-8">Last updated on Jun 05th, 2024</p>

        <div class="prose prose-surface max-w-none text-surface-600 leading-relaxed space-y-4">
            <p>The Website Owner, including subsidiaries and affiliates ("Website" or "Website Owner" or "we" or "us" or "our") provides the information contained on the website or any of the pages comprising the website ("website") to visitors ("visitors") (cumulatively referred to as "you" or "your" hereinafter) subject to the terms and conditions set out in these website terms and conditions, the privacy policy and any other relevant terms and conditions, policies and notices which may be applicable to a specific section or module of the website.</p>

            <p>Welcome to our website. If you continue to browse and use this website you are agreeing to comply with and be bound by the following terms and conditions of use, which together with our privacy policy govern KOOCHANA PUBLICATIONS PRIVATE LIMITED's relationship with you in relation to this website.</p>

            <p>The term 'KOOCHANA PUBLICATIONS PRIVATE LIMITED' or 'us' or 'we' refers to the owner of the website whose registered/operational office is N YUGENDHERINI, BUILDING NO-8-3-940, 8-3-940/A, YELLAREDDY GUDA, HYDERABAD, Hyderabad TG 500038. The term 'you' refers to the user or viewer of our website.</p>

            <h2 class="font-display text-xl font-semibold text-surface-800 mt-8 mb-3">Terms of Use</h2>
            <p>The use of this website is subject to the following terms of use:</p>
            <ul class="list-disc pl-6 space-y-2">
                <li>The content of the pages of this website is for your general information and use only. It is subject to change without notice.</li>
                <li>Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.</li>
                <li>Your use of any information or materials on this website is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, services or information available through this website meet your specific requirements.</li>
                <li>This website contains material which is owned by or licensed to us. This material includes, but is not limited to, the design, layout, look, appearance and graphics. Reproduction is prohibited other than in accordance with the copyright notice, which forms part of these terms and conditions.</li>
                <li>All trademarks reproduced in this website which are not the property of, or licensed to, the operator are acknowledged on the website.</li>
                <li>Unauthorized use of this website may give rise to a claim for damages and/or be a criminal offense.</li>
                <li>From time to time this website may also include links to other websites. These links are provided for your convenience to provide further information.</li>
                <li>You may not create a link to this website from another website or document without KOOCHANA PUBLICATIONS PRIVATE LIMITED's prior written consent.</li>
                <li>Your use of this website and any dispute arising out of such use of the website is subject to the laws of India or other regulatory authority.</li>
            </ul>

            <p class="mt-6">We as a merchant shall be under no liability whatsoever in respect of any loss or damage arising directly or indirectly out of the decline of authorization for any Transaction, on Account of the Cardholder having exceeded the preset limit mutually agreed by us with our acquiring bank from time to time.</p>
        </div>
    </div>
</div>
@endsection
