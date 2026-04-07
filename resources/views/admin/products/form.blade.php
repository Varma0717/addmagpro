@extends('layouts.admin')
@section('title', isset($product) ? 'Edit Product' : 'Add Product')

@section('content')
<div class="max-w-2xl">
    <div class="bg-white rounded-xl shadow-sm border p-6">
        <h2 class="text-lg font-semibold text-gray-700 mb-6">{{ isset($product) ? 'Edit Product' : 'New Product' }}</h2>

        <form method="POST"
            action="{{ isset($product) ? route('admin.products.update', $product) : route('admin.products.store') }}"
            enctype="multipart/form-data"
            class="space-y-5">
            @csrf
            @if(isset($product)) @method('PUT') @endif

            <div class="grid md:grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Product Name</label>
                    <input name="name" value="{{ old('name', $product->name ?? '') }}" required
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                    @error('name')<p class="text-red-500 text-xs mt-1">{{ $message }}</p>@enderror
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Category</label>
                    <select name="category_id" required class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
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
                <label class="block text-sm font-medium text-gray-700 mb-1">Description</label>
                <textarea name="description" rows="4"
                    class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">{{ old('description', $product->description ?? '') }}</textarea>
            </div>

            <div class="grid md:grid-cols-3 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Price (₹)</label>
                    <input name="price" type="number" step="0.01" min="0" value="{{ old('price', $product->price ?? '') }}" required
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Sale Price (₹)</label>
                    <input name="sale_price" type="number" step="0.01" min="0" value="{{ old('sale_price', $product->sale_price ?? '') }}"
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Stock Qty</label>
                    <input name="stock_qty" type="number" min="0" value="{{ old('stock_qty', $product->stock_qty ?? 0) }}" required
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                </div>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Upload Images</label>
                <input type="file" name="images[]" accept="image/*" multiple
                    class="w-full text-sm text-gray-600 file:mr-3 file:py-1.5 file:px-3 file:rounded file:border-0 file:text-sm file:bg-orange-50 file:text-orange-700 hover:file:bg-orange-100">
                @error('images.*')<p class="text-red-500 text-xs mt-1">{{ $message }}</p>@enderror

                @if(isset($product) && $product->images->count())
                <div class="flex flex-wrap gap-3 mt-3">
                    @foreach($product->images as $img)
                    <div class="relative">
                        <img src="{{ Storage::url($img->image_path) }}" class="w-20 h-20 object-cover rounded-lg border">
                        <form method="POST" action="{{ route('admin.products.images.destroy', $img) }}">
                            @csrf @method('DELETE')
                            <button type="submit" class="absolute -top-2 -right-2 bg-red-500 text-white rounded-full w-5 h-5 text-xs flex items-center justify-center hover:bg-red-600">×</button>
                        </form>
                    </div>
                    @endforeach
                </div>
                @endif
            </div>

            <div class="flex gap-4">
                <label class="flex items-center gap-2 text-sm font-medium text-gray-700">
                    <input type="checkbox" name="is_active" value="1" class="w-4 h-4 text-orange-500"
                        {{ old('is_active', $product->is_active ?? true) ? 'checked' : '' }}>
                    Active
                </label>
                <label class="flex items-center gap-2 text-sm font-medium text-gray-700">
                    <input type="checkbox" name="is_featured" value="1" class="w-4 h-4 text-orange-500"
                        {{ old('is_featured', $product->is_featured ?? false) ? 'checked' : '' }}>
                    Featured
                </label>
            </div>

            <div class="flex gap-3 pt-2">
                <button type="submit" class="px-5 py-2 bg-orange-500 text-white rounded-lg text-sm hover:bg-orange-600">
                    {{ isset($product) ? 'Update Product' : 'Create Product' }}
                </button>
                <a href="{{ route('admin.products.index') }}" class="px-5 py-2 border border-gray-300 rounded-lg text-sm hover:bg-gray-50">Cancel</a>
            </div>
        </form>
    </div>
</div>
@endsection