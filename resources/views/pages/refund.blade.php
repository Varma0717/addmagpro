@extends('layouts.app')
@section('title', 'Refund & Cancellation Policy')

@section('content')
<div class="max-w-4xl mx-auto">
    <nav class="flex items-center gap-2 text-sm text-surface-400 mb-6">
        <a href="{{ route('home') }}" class="hover:text-brand-500">Home</a>
        <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5"/></svg>
        <span class="text-surface-600">Refund & Cancellation Policy</span>
    </nav>

    <div class="bg-white rounded-2xl shadow-soft border border-surface-100 p-8 md:p-12">
        <h1 class="font-display text-3xl font-bold text-surface-900 mb-2">Refund & Cancellation Policy</h1>
        <p class="text-surface-400 text-sm mb-8">Last updated on Jun 05th, 2024</p>

        <div class="prose prose-surface max-w-none text-surface-600 leading-relaxed space-y-4">
            <p>KOOCHANA PUBLICATIONS PRIVATE LIMITED believes in helping its customers as far as possible, and has therefore a liberal cancellation policy. Under this policy:</p>

            <ul class="list-disc pl-6 space-y-3">
                <li>Cancellations will be considered only if the request is made immediately after placing the order. However, the cancellation request may not be entertained if the orders have been communicated to the vendors/merchants and they have initiated the process of shipping them.</li>
                <li>KOOCHANA PUBLICATIONS PRIVATE LIMITED does not accept cancellation requests for perishable items like flowers, eatables etc. However, refund/replacement can be made if the customer establishes that the quality of product delivered is not good.</li>
                <li>In case of receipt of damaged or defective items please report the same to our Customer Service team. The request will, however, be entertained once the merchant has checked and determined the same at his own end. This should be reported within <strong>2 days</strong> of receipt of the products.</li>
                <li>In case you feel that the product received is not as shown on the site or as per your expectations, you must bring it to the notice of our customer service within <strong>2 days</strong> of receiving the product. The Customer Service Team after looking into your complaint will take an appropriate decision.</li>
                <li>In case of complaints regarding products that come with a warranty from manufacturers, please refer the issue to them.</li>
            </ul>

            <div class="bg-brand-50 border border-brand-200 rounded-xl p-4 mt-6">
                <p class="text-brand-800 font-medium">In case of any Refunds approved by KOOCHANA PUBLICATIONS PRIVATE LIMITED, it will take <strong>1-2 days</strong> for the refund to be processed to the end customer.</p>
            </div>
        </div>
    </div>
</div>
@endsection
