@extends('layouts.admin')
@section('title', isset($category) ? 'Edit Category' : 'Add Category')

@section('content')
<div class="max-w-xl">
    <div class="card p-6">
        <div class="flex items-center gap-2 mb-6">
            <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6A2.25 2.25 0 0 1 6 3.75h2.25A2.25 2.25 0 0 1 10.5 6v2.25a2.25 2.25 0 0 1-2.25 2.25H6a2.25 2.25 0 0 1-2.25-2.25V6ZM3.75 15.75A2.25 2.25 0 0 1 6 13.5h2.25a2.25 2.25 0 0 1 2.25 2.25V18a2.25 2.25 0 0 1-2.25 2.25H6A2.25 2.25 0 0 1 3.75 18v-2.25ZM13.5 6a2.25 2.25 0 0 1 2.25-2.25H18A2.25 2.25 0 0 1 20.25 6v2.25A2.25 2.25 0 0 1 18 10.5h-2.25a2.25 2.25 0 0 1-2.25-2.25V6ZM13.5 15.75a2.25 2.25 0 0 1 2.25-2.25H18a2.25 2.25 0 0 1 2.25 2.25V18A2.25 2.25 0 0 1 18 20.25h-2.25a2.25 2.25 0 0 1-2.25-2.25v-2.25Z" />
            </svg>
            <h2 class="text-lg font-display font-semibold text-surface-700">{{ isset($category) ? 'Edit Category' : 'New Category' }}</h2>
        </div>

        <form method="POST"
            action="{{ isset($category) ? route('admin.categories.update', $category) : route('admin.categories.store') }}"
            enctype="multipart/form-data"
            class="space-y-5">
            @csrf
            @if(isset($category)) @method('PUT') @endif

            <div>
                <label class="block text-sm font-medium text-surface-700 mb-1">Name</label>
                <input name="name" value="{{ old('name', $category->name ?? '') }}" required class="input w-full">
                @error('name')<p class="text-red-500 text-xs mt-1">{{ $message }}</p>@enderror
            </div>

            <div>
                <label class="block text-sm font-medium text-surface-700 mb-1">Type</label>
                <select name="type" class="input w-full">
                    <option value="ecommerce" {{ old('type', $category->type ?? '') === 'ecommerce' ? 'selected' : '' }}>Ecommerce</option>
                    <option value="service" {{ old('type', $category->type ?? '') === 'service'   ? 'selected' : '' }}>Service</option>
                </select>
            </div>

            <div>
                <label class="block text-sm font-medium text-surface-700 mb-1">Parent Category (optional)</label>
                <select name="parent_id" class="input w-full">
                    <option value="">— None —</option>
                    @foreach($parents as $parent)
                    <option value="{{ $parent->id }}" {{ old('parent_id', $category->parent_id ?? '') == $parent->id ? 'selected' : '' }}>
                        {{ $parent->name }}
                    </option>
                    @endforeach
                </select>
            </div>

            <div>
                <label class="block text-sm font-medium text-surface-700 mb-1">Image</label>
                @if(isset($category) && $category->image)
                <img src="{{ imageUrl($category->image) }}" class="w-20 h-20 object-cover rounded-lg ring-1 ring-surface-200 mb-2">
                @endif
                <input type="file" name="image" accept="image/*"
                    class="w-full text-sm text-surface-600 file:mr-3 file:py-1.5 file:px-3 file:rounded-lg file:border-0 file:text-sm file:font-medium file:bg-brand-50 file:text-brand-700 hover:file:bg-brand-100 file:cursor-pointer">
                @error('image')<p class="text-red-500 text-xs mt-1">{{ $message }}</p>@enderror
            </div>

            <div class="flex items-center gap-2">
                <input type="checkbox" name="is_active" id="is_active" value="1"
                    {{ old('is_active', $category->is_active ?? true) ? 'checked' : '' }}
                    class="w-4 h-4 rounded border-surface-300 text-brand-600 focus:ring-brand-500">
                <label for="is_active" class="text-sm font-medium text-surface-700">Active</label>
            </div>

            <div class="flex gap-3 pt-2">
                <button type="submit" class="btn-primary">
                    {{ isset($category) ? 'Update Category' : 'Create Category' }}
                </button>
                <a href="{{ route('admin.categories.index') }}" class="btn-ghost">Cancel</a>
            </div>
        </form>
    </div>
</div>
@endsection