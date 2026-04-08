@extends('layouts.admin')
@section('title', isset($coupon) ? 'Edit Coupon' : 'Add Coupon')

@section('content')
<div class="max-w-xl">
    <div class="card p-6">
        <div class="flex items-center gap-2 mb-6">
            <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M16.5 6v.75m0 3v.75m0 3v.75m0 3V18m-9-5.25h5.25M7.5 15h3M3.375 5.25c-.621 0-1.125.504-1.125 1.125v3.026a2.999 2.999 0 0 1 0 5.198v3.026c0 .621.504 1.125 1.125 1.125h17.25c.621 0 1.125-.504 1.125-1.125v-3.026a2.999 2.999 0 0 1 0-5.198V6.375c0-.621-.504-1.125-1.125-1.125H3.375Z"/></svg>
            <h2 class="font-display text-lg font-semibold text-surface-800">{{ isset($coupon) ? 'Edit Coupon' : 'New Coupon' }}</h2>
        </div>

        <form method="POST"
            action="{{ isset($coupon) ? route('admin.coupons.update', $coupon) : route('admin.coupons.store') }}"
            class="space-y-5">
            @csrf
            @if(isset($coupon)) @method('PUT') @endif

            <div>
                <label class="block text-sm font-medium text-surface-700 mb-1">Code (leave blank to auto-generate)</label>
                <input name="code" value="{{ old('code', $coupon->code ?? '') }}"
                    class="input w-full font-mono uppercase"
                    placeholder="e.g. SAVE50">
            </div>

            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-medium text-surface-700 mb-1">Type</label>
                    <select name="type" class="input w-full">
                        <option value="flat" {{ old('type', $coupon->type ?? '') === 'flat'    ? 'selected' : '' }}>Flat (₹)</option>
                        <option value="percent" {{ old('type', $coupon->type ?? '') === 'percent' ? 'selected' : '' }}>Percent (%)</option>
                    </select>
                </div>
                <div>
                    <label class="block text-sm font-medium text-surface-700 mb-1">Value</label>
                    <input name="value" type="number" step="0.01" min="0" required
                        value="{{ old('value', $coupon->value ?? '') }}" class="input w-full">
                </div>
            </div>

            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-medium text-surface-700 mb-1">Min Order Amount (₹)</label>
                    <input name="min_order_amount" type="number" step="0.01" min="0"
                        value="{{ old('min_order_amount', $coupon->min_order_amount ?? '') }}" class="input w-full">
                </div>
                <div>
                    <label class="block text-sm font-medium text-surface-700 mb-1">Max Discount (₹, for %)</label>
                    <input name="max_discount_amount" type="number" step="0.01" min="0"
                        value="{{ old('max_discount_amount', $coupon->max_discount_amount ?? '') }}" class="input w-full">
                </div>
            </div>

            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-medium text-surface-700 mb-1">Usage Limit</label>
                    <input name="usage_limit" type="number" min="1"
                        value="{{ old('usage_limit', $coupon->usage_limit ?? '') }}"
                        placeholder="Unlimited" class="input w-full">
                </div>
                <div>
                    <label class="block text-sm font-medium text-surface-700 mb-1">Per-User Limit</label>
                    <input name="per_user_limit" type="number" min="1"
                        value="{{ old('per_user_limit', $coupon->per_user_limit ?? '') }}"
                        placeholder="Unlimited" class="input w-full">
                </div>
            </div>

            <div>
                <label class="block text-sm font-medium text-surface-700 mb-1">Expiry Date</label>
                <input name="expires_at" type="date"
                    value="{{ old('expires_at', isset($coupon) && $coupon->expires_at ? $coupon->expires_at->format('Y-m-d') : '') }}"
                    class="input w-full">
            </div>

            <label class="flex items-center gap-2 text-sm font-medium text-surface-700">
                <input type="checkbox" name="is_active" value="1" class="w-4 h-4 text-brand-600 rounded border-surface-300 focus:ring-brand-500"
                    {{ old('is_active', $coupon->is_active ?? true) ? 'checked' : '' }}>
                Active
            </label>

            <div class="flex gap-3 pt-2">
                <button type="submit" class="btn-primary">Save Coupon</button>
                <a href="{{ route('admin.coupons.index') }}" class="btn-ghost">Cancel</a>
            </div>
        </form>
    </div>
</div>
@endsection