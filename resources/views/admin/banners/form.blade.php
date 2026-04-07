@extends('layouts.admin')
@section('title', isset($banner) ? 'Edit Banner' : 'Add Banner')

@section('content')
<div class="max-w-xl">
    <div class="bg-white rounded-xl shadow-sm border p-6">
        <h2 class="text-lg font-semibold text-gray-700 mb-6">{{ isset($banner) ? 'Edit Banner' : 'New Banner' }}</h2>

        <form method="POST"
            action="{{ isset($banner) ? route('admin.banners.update', $banner) : route('admin.banners.store') }}"
            enctype="multipart/form-data"
            class="space-y-5">
            @csrf
            @if(isset($banner)) @method('PUT') @endif

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Title (optional)</label>
                <input name="title" value="{{ old('title', $banner->title ?? '') }}"
                    class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Link URL (optional)</label>
                <input name="link_url" value="{{ old('link_url', $banner->link_url ?? '') }}"
                    class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Placement</label>
                <select name="placement" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                    @foreach(['carousel','mid','footer'] as $p)
                    <option value="{{ $p }}" {{ old('placement', $banner->placement ?? '') === $p ? 'selected' : '' }}>{{ ucfirst($p) }}</option>
                    @endforeach
                </select>
            </div>

            <div class="grid grid-cols-2 gap-3">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Start Date</label>
                    <input name="starts_at" type="date" value="{{ old('starts_at', isset($banner) && $banner->starts_at ? $banner->starts_at->format('Y-m-d') : '') }}"
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">End Date</label>
                    <input name="ends_at" type="date" value="{{ old('ends_at', isset($banner) && $banner->ends_at ? $banner->ends_at->format('Y-m-d') : '') }}"
                        class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                </div>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Image</label>
                @if(isset($banner))
                <img src="{{ Storage::url($banner->image_path) }}" class="h-28 rounded-lg object-cover mb-2">
                @endif
                <input type="file" name="image" accept="image/*" {{ isset($banner) ? '' : 'required' }}
                    class="w-full text-sm text-gray-600 file:mr-3 file:py-1.5 file:px-3 file:rounded file:border-0 file:text-sm file:bg-orange-50 file:text-orange-700 hover:file:bg-orange-100">
            </div>

            <label class="flex items-center gap-2 text-sm font-medium text-gray-700">
                <input type="checkbox" name="is_active" value="1" class="w-4 h-4 text-orange-500"
                    {{ old('is_active', $banner->is_active ?? true) ? 'checked' : '' }}>
                Active
            </label>

            <div class="flex gap-3 pt-2">
                <button type="submit" class="px-5 py-2 bg-orange-500 text-white rounded-lg text-sm hover:bg-orange-600">Save Banner</button>
                <a href="{{ route('admin.banners.index') }}" class="px-5 py-2 border border-gray-300 rounded-lg text-sm hover:bg-gray-50">Cancel</a>
            </div>
        </form>
    </div>
</div>
@endsection