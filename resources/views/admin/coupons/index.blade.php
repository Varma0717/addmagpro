@extends('layouts.admin')
@section('title', 'Coupons')

@section('content')
<div class="flex items-center justify-between mb-6">
    <div class="flex items-center gap-2">
        <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M16.5 6v.75m0 3v.75m0 3v.75m0 3V18m-9-5.25h5.25M7.5 15h3M3.375 5.25c-.621 0-1.125.504-1.125 1.125v3.026a2.999 2.999 0 0 1 0 5.198v3.026c0 .621.504 1.125 1.125 1.125h17.25c.621 0 1.125-.504 1.125-1.125v-3.026a2.999 2.999 0 0 1 0-5.198V6.375c0-.621-.504-1.125-1.125-1.125H3.375Z"/></svg>
        <h2 class="font-display text-lg font-semibold text-surface-800">Coupons</h2>
    </div>
    <a href="{{ route('admin.coupons.create') }}" class="btn-primary">
        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15"/></svg>
        Add Coupon
    </a>
</div>

<div class="card overflow-hidden">
    <table class="w-full text-sm">
        <thead>
            <tr>
                <th class="table-header">Code</th>
                <th class="table-header">Type</th>
                <th class="table-header">Value</th>
                <th class="table-header">Min Order</th>
                <th class="table-header">Used / Limit</th>
                <th class="table-header">Expiry</th>
                <th class="table-header">Active</th>
                <th class="table-header">Actions</th>
            </tr>
        </thead>
        <tbody class="divide-y divide-surface-100">
            @forelse($coupons as $coupon)
            <tr class="hover:bg-surface-50 transition-colors">
                <td class="table-cell font-mono font-medium text-brand-600">{{ $coupon->code }}</td>
                <td class="table-cell">
                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 bg-surface-50 text-surface-600 ring-surface-200">
                        {{ $coupon->type === 'flat' ? 'Flat ₹' : 'Percent %' }}
                    </span>
                </td>
                <td class="table-cell font-medium">{{ $coupon->type === 'flat' ? '₹'.$coupon->value : $coupon->value.'%' }}</td>
                <td class="table-cell">{{ $coupon->min_order_amount ? '₹'.$coupon->min_order_amount : '—' }}</td>
                <td class="table-cell text-surface-500">
                    {{ $coupon->used_count }} / {{ $coupon->usage_limit ?? '∞' }}
                </td>
                <td class="table-cell text-surface-400">{{ $coupon->expires_at ? $coupon->expires_at->format('d M Y') : '—' }}</td>
                <td class="table-cell">
                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 {{ $coupon->is_active ? 'bg-emerald-50 text-emerald-700 ring-emerald-200' : 'bg-surface-50 text-surface-500 ring-surface-200' }}">
                        {{ $coupon->is_active ? 'Yes' : 'No' }}
                    </span>
                </td>
                <td class="table-cell">
                    <div class="flex gap-2">
                        <a href="{{ route('admin.coupons.edit', $coupon) }}" class="btn-ghost btn-sm">
                            <svg class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125"/></svg>
                            Edit
                        </a>
                        <form method="POST" action="{{ route('admin.coupons.destroy', $coupon) }}" onsubmit="return confirm('Delete coupon?')">
                            @csrf @method('DELETE')
                            <button class="btn-danger btn-sm">
                                <svg class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0"/></svg>
                                Delete
                            </button>
                        </form>
                    </div>
                </td>
            </tr>
            @empty
            <tr>
                <td colspan="8" class="table-cell text-center text-surface-400 py-8">No coupons yet.</td>
            </tr>
            @endforelse
        </tbody>
    </table>
</div>
@endsection