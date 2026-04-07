@extends('layouts.admin')
@section('title', isset($coupon) ? 'Edit Coupon' : 'Add Coupon')

@section('content')
<div class="max-w-xl">
    <div class="bg-white rounded-xl shadow-sm border p-6">
        <h2 class="text-lg font-semibold text-gray-700 mb-6">{{ isset($coupon) ? 'Edit Coupon' : 'New Coupon' }}</h2>

        <form method="POST"
            action="{{ isset($coupon) ? route('admin.coupons.update', $coupon) : route('admin.coupons.store') }}"
            class="space-y-5">
            @csrf
            @if(isset($coupon)) @method('PUT') @endif

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Code (leave blank to auto-generate)</label>
                <input name="code" value="{{ old('code', $coupon->code ?? '') }}"
                    class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm font-mono uppercase focus:outline-none focus:ring-2 focus:ring-orange-400"
                    placeholder="e.g. SAVE50">
            </div>

            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Type</label>
                    <select name="type" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                        <option value="flat" {{ old('type', $coupon->type ?? '') === 'flat'    ? 'selected' : '' }}>Flat (₹)</option>
                        <option value="percent" {{ old('type', $coupon->type ?? '') === 'percent' ? 'selected' : '' }}>Percent (%)</option>
                    </select>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Value</label>
                    <input name="value" type="number" step="0.01" min="0" required
                        value="{{ old('value', $coupon->value ?? '') }}"
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                </div>
            </div>

            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Min Order Amount (₹)</label>
                    <input name="min_order_amount" type="number" step="0.01" min="0"
                        value="{{ old('min_order_amount', $coupon->min_order_amount ?? '') }}"
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Max Discount (₹, for %)</label>
                    <input name="max_discount_amount" type="number" step="0.01" min="0"
                        value="{{ old('max_discount_amount', $coupon->max_discount_amount ?? '') }}"
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                </div>
            </div>

            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Usage Limit</label>
                    <input name="usage_limit" type="number" min="1"
                        value="{{ old('usage_limit', $coupon->usage_limit ?? '') }}"
                        placeholder="Unlimited"
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Per-User Limit</label>
                    <input name="per_user_limit" type="number" min="1"
                        value="{{ old('per_user_limit', $coupon->per_user_limit ?? '') }}"
                        placeholder="Unlimited"
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                </div>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Expiry Date</label>
                <input name="expires_at" type="date"
                    value="{{ old('expires_at', isset($coupon) && $coupon->expires_at ? $coupon->expires_at->format('Y-m-d') : '') }}"
                    class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
            </div>

            <label class="flex items-center gap-2 text-sm font-medium text-gray-700">
                <input type="checkbox" name="is_active" value="1" class="w-4 h-4 text-orange-500"
                    {{ old('is_active', $coupon->is_active ?? true) ? 'checked' : '' }}>
                Active
            </label>

            <div class="flex gap-3 pt-2">
                <button type="submit" class="px-5 py-2 bg-orange-500 text-white rounded-lg text-sm hover:bg-orange-600">Save Coupon</button>
                <a href="{{ route('admin.coupons.index') }}" class="px-5 py-2 border border-gray-300 rounded-lg text-sm hover:bg-gray-50">Cancel</a>
            </div>
        </form>
    </div>
</div>
@endsection