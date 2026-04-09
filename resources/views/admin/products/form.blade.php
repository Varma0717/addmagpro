@extends('layouts.admin')
@section('title', isset($product) ? 'Edit Product' : 'Add Product')

@section('content')
<div class="max-w-2xl">
    <div class="card p-6">
        <div class="flex items-center gap-2 mb-6">
            <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="m20.25 7.5-.625 10.632a2.25 2.25 0 0 1-2.247 2.118H6.622a2.25 2.25 0 0 1-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125Z" />
            </svg>
            <h2 class="text-lg font-display font-semibold text-surface-700">{{ isset($product) ? 'Edit Product' : 'New Product' }}</h2>
        </div>

        <form method="POST"
            action="{{ isset($product) ? route('admin.products.update', $product) : route('admin.products.store') }}"
            enctype="multipart/form-data"
            class="space-y-5">
            @csrf
            @if(isset($product)) @method('PUT') @endif

            <div class="grid md:grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-medium text-surface-700 mb-1">Product Name</label>
                    <input name="name" value="{{ old('name', $product->name ?? '') }}" required class="input w-full">
                    @error('name')<p class="text-red-500 text-xs mt-1">{{ $message }}</p>@enderror
                </div>
                <div>
                    <label class="block text-sm font-medium text-surface-700 mb-1">Category</label>
                    <select name="category_id" required class="input w-full">
                        <option value="">Select category</option>
                        @foreach($categories as $cat)
                        <option value="{{ $cat->id }}" {{ old('category_id', $product->category_id ?? '') == $cat->id ? 'selected' : '' }}>
                            {{ $cat->name }}
                        </option>
                        @endforeach
                    </select>
                </div>
            </div>

            <div>
                <label class="block text-sm font-medium text-surface-700 mb-1">Description</label>
                <textarea name="description" rows="4" class="input w-full">{{ old('description', $product->description ?? '') }}</textarea>
            </div>

            <div class="grid md:grid-cols-3 gap-4">
                <div>
                    <label class="block text-sm font-medium text-surface-700 mb-1">Price (₹)</label>
                    <input name="price" type="number" step="0.01" min="0" value="{{ old('price', $product->price ?? '') }}" required class="input w-full">
                </div>
                <div>
                    <label class="block text-sm font-medium text-surface-700 mb-1">Sale Price (₹)</label>
                    <input name="sale_price" type="number" step="0.01" min="0" value="{{ old('sale_price', $product->sale_price ?? '') }}" class="input w-full">
                </div>
                <div>
                    <label class="block text-sm font-medium text-surface-700 mb-1">Stock Qty</label>
                    <input name="stock_qty" type="number" min="0" value="{{ old('stock_qty', $product->stock_qty ?? 0) }}" required class="input w-full">
                </div>
            </div>

            <div>
                <label class="block text-sm font-medium text-surface-700 mb-1">Upload Images</label>
                <input type="file" name="images[]" accept="image/*" multiple
                    class="w-full text-sm text-surface-600 file:mr-3 file:py-1.5 file:px-3 file:rounded-lg file:border-0 file:text-sm file:font-medium file:bg-brand-50 file:text-brand-700 hover:file:bg-brand-100 file:cursor-pointer">
                @error('images.*')<p class="text-red-500 text-xs mt-1">{{ $message }}</p>@enderror

                @if(isset($product) && $product->images->count())
                <div class="flex flex-wrap gap-3 mt-3">
                    @foreach($product->images as $img)
                    <div class="relative group">
                        <img src="{{ Storage::url($img->image_path) }}" class="w-20 h-20 object-cover rounded-lg ring-1 ring-surface-200">
                        <form method="POST" action="{{ route('admin.products.images.destroy', $img) }}">
                            @csrf @method('DELETE')
                            <button type="submit" class="absolute -top-2 -right-2 bg-red-500 text-white rounded-full w-5 h-5 text-xs flex items-center justify-center hover:bg-red-600 shadow-soft">
                                <svg class="w-3 h-3" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
                                </svg>
                            </button>
                        </form>
                    </div>
                    @endforeach
                </div>
                @endif
            </div>

            <div class="flex gap-4">
                <label class="flex items-center gap-2 text-sm font-medium text-surface-700">
                    <input type="checkbox" name="is_active" value="1" class="w-4 h-4 rounded border-surface-300 text-brand-600 focus:ring-brand-500"
                        {{ old('is_active', $product->is_active ?? true) ? 'checked' : '' }}>
                    Active
                </label>
                <label class="flex items-center gap-2 text-sm font-medium text-surface-700">
                    <input type="checkbox" name="is_featured" value="1" class="w-4 h-4 rounded border-surface-300 text-brand-600 focus:ring-brand-500"
                        {{ old('is_featured', $product->is_featured ?? false) ? 'checked' : '' }}>
                    Featured
                </label>
            </div>

            <div class="flex gap-3 pt-2">
                <button type="submit" class="btn-primary">
                    {{ isset($product) ? 'Update Product' : 'Create Product' }}
                </button>
                <a href="{{ route('admin.products.index') }}" class="btn-ghost">Cancel</a>
            </div>
        </form>
    </div>
</div>
@endsection