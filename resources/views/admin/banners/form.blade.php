@extends('layouts.admin')
@section('title', isset($banner) ? 'Edit Banner' : 'Add Banner')

@section('content')
<div class="max-w-xl">
    <div class="card p-6">
        <div class="flex items-center gap-2 mb-6">
            <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="m2.25 15.75 5.159-5.159a2.25 2.25 0 0 1 3.182 0l5.159 5.159m-1.5-1.5 1.409-1.409a2.25 2.25 0 0 1 3.182 0l2.909 2.909M3.75 21h16.5A2.25 2.25 0 0 0 22.5 18.75V5.25A2.25 2.25 0 0 0 20.25 3H3.75A2.25 2.25 0 0 0 1.5 5.25v13.5A2.25 2.25 0 0 0 3.75 21ZM8.25 8.625a1.125 1.125 0 1 0 0 2.25 1.125 1.125 0 0 0 0-2.25Z" />
            </svg>
            <h2 class="font-display text-lg font-semibold text-surface-800">{{ isset($banner) ? 'Edit Banner' : 'New Banner' }}</h2>
        </div>

        <form method="POST"
            action="{{ isset($banner) ? route('admin.banners.update', $banner) : route('admin.banners.store') }}"
            enctype="multipart/form-data"
            class="space-y-5">
            @csrf
            @if(isset($banner)) @method('PUT') @endif

            <div>
                <label class="block text-sm font-medium text-surface-700 mb-1">Title (optional)</label>
                <input name="title" value="{{ old('title', $banner->title ?? '') }}" class="input w-full">
            </div>

            <div>
                <label class="block text-sm font-medium text-surface-700 mb-1">Link URL (optional)</label>
                <input name="link_url" value="{{ old('link_url', $banner->link_url ?? '') }}" class="input w-full">
            </div>

            <div>
                <label class="block text-sm font-medium text-surface-700 mb-1">Placement</label>
                <select name="placement" class="input w-full">
                    @foreach(['carousel','mid','footer'] as $p)
                    <option value="{{ $p }}" {{ old('placement', $banner->placement ?? '') === $p ? 'selected' : '' }}>{{ ucfirst($p) }}</option>
                    @endforeach
                </select>
            </div>

            <div class="grid grid-cols-2 gap-3">
                <div>
                    <label class="block text-sm font-medium text-surface-700 mb-1">Start Date</label>
                    <input name="starts_at" type="date" value="{{ old('starts_at', isset($banner) && $banner->starts_at ? $banner->starts_at->format('Y-m-d') : '') }}" class="input w-full">
                </div>
                <div>
                    <label class="block text-sm font-medium text-surface-700 mb-1">End Date</label>
                    <input name="ends_at" type="date" value="{{ old('ends_at', isset($banner) && $banner->ends_at ? $banner->ends_at->format('Y-m-d') : '') }}" class="input w-full">
                </div>
            </div>

            <div>
                <label class="block text-sm font-medium text-surface-700 mb-1">Image</label>
                @if(isset($banner))
                <img src="{{ imageUrl($banner->image_path) }}" class="h-28 rounded-lg object-cover mb-2">
                @endif
                <input type="file" name="image" accept="image/*" {{ isset($banner) ? '' : 'required' }}
                    class="w-full text-sm text-surface-600 file:mr-3 file:py-1.5 file:px-3 file:rounded-lg file:border-0 file:text-sm file:font-medium file:bg-brand-50 file:text-brand-700 hover:file:bg-brand-100 file:cursor-pointer">
            </div>

            <label class="flex items-center gap-2 text-sm font-medium text-surface-700">
                <input type="checkbox" name="is_active" value="1" class="w-4 h-4 text-brand-600 rounded border-surface-300 focus:ring-brand-500"
                    {{ old('is_active', $banner->is_active ?? true) ? 'checked' : '' }}>
                Active
            </label>

            <div class="flex gap-3 pt-2">
                <button type="submit" class="btn-primary">Save Banner</button>
                <a href="{{ route('admin.banners.index') }}" class="btn-ghost">Cancel</a>
            </div>
        </form>
    </div>
</div>
@endsection