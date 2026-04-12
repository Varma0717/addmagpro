@extends('layouts.account')
@section('page_title', 'My Discount Shop Orders')
@section('title', 'My Discount Shop Orders')

@section('account_content')
<h2 class="text-xl font-bold font-display text-surface-800 mb-6">My Discount Shop Orders</h2>

<div class="card overflow-hidden">
    @if($orders->isEmpty())
    <div class="p-5 text-surface-500">No discount shop orders found.</div>
    @else
    <div class="overflow-x-auto">
        <table class="w-full text-sm">
            <thead>
                <tr>
                    <th class="table-header text-left">Store</th>
                    <th class="table-header text-left">Purchase</th>
                    <th class="table-header text-left">Discount %</th>
                    <th class="table-header text-left">Total</th>
                    <th class="table-header text-left">Date</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-surface-100">
                @foreach($orders as $order)
                <tr>
                    <td class="table-cell">{{ $order->store_name ?: '—' }}</td>
                    <td class="table-cell">₹{{ number_format((float) $order->purchase_amount, 2) }}</td>
                    <td class="table-cell">{{ $order->discount_margin }}%</td>
                    <td class="table-cell">₹{{ number_format((float) $order->total_amount, 2) }}</td>
                    <td class="table-cell">{{ $order->created_at->format('d M Y') }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    <div class="px-5 py-3 border-t border-surface-100">{{ $orders->links() }}</div>
    @endif
</div>
@endsection
