@extends('layouts.admin')
@section('title', isset($category) ? 'Edit Category' : 'Add Category')

@section('content')
<div class="max-w-xl">
    <div class="bg-white rounded-xl shadow-sm border p-6">
        <h2 class="text-lg font-semibold text-gray-700 mb-6">{{ isset($category) ? 'Edit Category' : 'New Category' }}</h2>

        <form method="POST"
            action="{{ isset($category) ? route('admin.categories.update', $category) : route('admin.categories.store') }}"
            enctype="multipart/form-data"
            class="space-y-5">
            @csrf
            @if(isset($category)) @method('PUT') @endif

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Name</label>
                <input name="name" value="{{ old('name', $category->name ?? '') }}" required
                    class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                @error('name')<p class="text-red-500 text-xs mt-1">{{ $message }}</p>@enderror
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Type</label>
                <select name="type" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                    <option value="ecommerce" {{ old('type', $category->type ?? '') === 'ecommerce' ? 'selected' : '' }}>Ecommerce</option>
                    <option value="service" {{ old('type', $category->type ?? '') === 'service'   ? 'selected' : '' }}>Service</option>
                </select>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Parent Category (optional)</label>
                <select name="parent_id" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                    <option value="">— None —</option>
                    @foreach($parents as $parent)
                    <option value="{{ $parent->id }}" {{ old('parent_id', $category->parent_id ?? '') == $parent->id ? 'selected' : '' }}>
                        {{ $parent->name }}
                    </option>
                    @endforeach
                </select>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Image</label>
                @if(isset($category) && $category->image)
                <img src="{{ Storage::url($category->image) }}" class="w-20 h-20 object-cover rounded-lg mb-2">
                @endif
                <input type="file" name="image" accept="image/*"
                    class="w-full text-sm text-gray-600 file:mr-3 file:py-1.5 file:px-3 file:rounded file:border-0 file:text-sm file:bg-orange-50 file:text-orange-700 hover:file:bg-orange-100">
                @error('image')<p class="text-red-500 text-xs mt-1">{{ $message }}</p>@enderror
            </div>

            <div class="flex items-center gap-2">
                <input type="checkbox" name="is_active" id="is_active" value="1"
                    {{ old('is_active', $category->is_active ?? true) ? 'checked' : '' }}
                    class="w-4 h-4 text-orange-500">
                <label for="is_active" class="text-sm font-medium text-gray-700">Active</label>
            </div>

            <div class="flex gap-3 pt-2">
                <button type="submit" class="px-5 py-2 bg-orange-500 text-white rounded-lg text-sm hover:bg-orange-600">
                    {{ isset($category) ? 'Update Category' : 'Create Category' }}
                </button>
                <a href="{{ route('admin.categories.index') }}" class="px-5 py-2 border border-gray-300 rounded-lg text-sm hover:bg-gray-50">Cancel</a>
            </div>
        </form>
    </div>
</div>
@endsection