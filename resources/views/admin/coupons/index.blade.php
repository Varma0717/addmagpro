@extends('layouts.admin')
@section('title', 'Coupons')

@section('content')
<div class="flex items-center justify-between mb-6">
    <h2 class="text-lg font-semibold text-gray-700">Coupons</h2>
    <a href="{{ route('admin.coupons.create') }}" class="px-4 py-2 bg-orange-500 text-white rounded-lg text-sm hover:bg-orange-600">+ Add Coupon</a>
</div>

<div class="bg-white rounded-xl shadow-sm border overflow-hidden">
    <table class="w-full text-sm">
        <thead class="bg-gray-50 text-gray-500 text-xs uppercase">
            <tr>
                <th class="px-4 py-3 text-left">Code</th>
                <th class="px-4 py-3 text-left">Type</th>
                <th class="px-4 py-3 text-left">Value</th>
                <th class="px-4 py-3 text-left">Min Order</th>
                <th class="px-4 py-3 text-left">Used / Limit</th>
                <th class="px-4 py-3 text-left">Expiry</th>
                <th class="px-4 py-3 text-left">Active</th>
                <th class="px-4 py-3 text-left">Actions</th>
            </tr>
        </thead>
        <tbody class="divide-y">
            @forelse($coupons as $coupon)
            <tr class="hover:bg-gray-50">
                <td class="px-4 py-3 font-mono font-medium text-orange-600">{{ $coupon->code }}</td>
                <td class="px-4 py-3">
                    <span class="px-2 py-1 rounded text-xs bg-gray-100 text-gray-600">
                        {{ $coupon->type === 'flat' ? 'Flat ₹' : 'Percent %' }}
                    </span>
                </td>
                <td class="px-4 py-3">{{ $coupon->type === 'flat' ? '₹'.$coupon->value : $coupon->value.'%' }}</td>
                <td class="px-4 py-3">{{ $coupon->min_order_amount ? '₹'.$coupon->min_order_amount : '—' }}</td>
                <td class="px-4 py-3 text-gray-500">
                    {{ $coupon->used_count }} / {{ $coupon->usage_limit ?? '∞' }}
                </td>
                <td class="px-4 py-3 text-gray-400">{{ $coupon->expires_at ? $coupon->expires_at->format('d M Y') : '—' }}</td>
                <td class="px-4 py-3">
                    <span class="px-2 py-1 rounded-full text-xs {{ $coupon->is_active ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-500' }}">
                        {{ $coupon->is_active ? 'Yes' : 'No' }}
                    </span>
                </td>
                <td class="px-4 py-3 flex gap-2">
                    <a href="{{ route('admin.coupons.edit', $coupon) }}" class="text-xs px-3 py-1 border border-gray-300 rounded hover:bg-gray-50">Edit</a>
                    <form method="POST" action="{{ route('admin.coupons.destroy', $coupon) }}" onsubmit="return confirm('Delete coupon?')">
                        @csrf @method('DELETE')
                        <button class="text-xs px-3 py-1 border border-red-400 text-red-600 rounded hover:bg-red-50">Delete</button>
                    </form>
                </td>
            </tr>
            @empty
            <tr>
                <td colspan="8" class="px-4 py-8 text-center text-gray-400">No coupons yet.</td>
            </tr>
            @endforelse
        </tbody>
    </table>
</div>
@endsection