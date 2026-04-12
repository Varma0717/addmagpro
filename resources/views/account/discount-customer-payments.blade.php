@extends('layouts.account')
@section('page_title', 'Discount Store Customer Payments')
@section('title', 'Discount Store Customer Payments')

@section('account_content')
<h2 class="text-xl font-bold font-display text-surface-800 mb-6">Discount Store Customer Payments</h2>

<div class="card overflow-hidden">
    @if($payments->isEmpty())
    <div class="p-5 text-surface-500">No customer payments found for your discount store.</div>
    @else
    <div class="overflow-x-auto">
        <table class="w-full text-sm">
            <thead>
                <tr>
                    <th class="table-header text-left">Store</th>
                    <th class="table-header text-left">Customer ID</th>
                    <th class="table-header text-left">Total Amount</th>
                    <th class="table-header text-left">Vendor Commission</th>
                    <th class="table-header text-left">Date</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-surface-100">
                @foreach($payments as $payment)
                <tr>
                    <td class="table-cell">{{ $payment->store_name ?: '—' }}</td>
                    <td class="table-cell">{{ $payment->customer_id ?: '—' }}</td>
                    <td class="table-cell">₹{{ number_format((float) $payment->total_amount, 2) }}</td>
                    <td class="table-cell">₹{{ number_format((float) $payment->vendor_commision, 2) }}</td>
                    <td class="table-cell">{{ $payment->created_at->format('d M Y') }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    <div class="px-5 py-3 border-t border-surface-100">{{ $payments->links() }}</div>
    @endif
</div>
@endsection
