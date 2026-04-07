@extends('layouts.admin')
@section('title', 'Banners')

@section('content')
<div class="flex items-center justify-between mb-6">
    <h2 class="text-lg font-semibold text-gray-700">Banners</h2>
    <a href="{{ route('admin.banners.create') }}" class="px-4 py-2 bg-orange-500 text-white rounded-lg text-sm hover:bg-orange-600">+ Add Banner</a>
</div>

<div class="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
    @forelse($banners as $banner)
    <div class="bg-white rounded-xl shadow-sm border overflow-hidden">
        <img src="{{ Storage::url($banner->image_path) }}" class="w-full h-40 object-cover">
        <div class="p-4">
            <div class="font-medium text-gray-800">{{ $banner->title ?? 'No title' }}</div>
            <div class="text-xs text-gray-500 mt-1">Placement: {{ $banner->placement }}</div>
            @if($banner->starts_at)
            <div class="text-xs text-gray-400 mt-1">{{ $banner->starts_at->format('d M') }} – {{ $banner->ends_at?->format('d M Y') }}</div>
            @endif
            <span class="inline-block mt-2 px-2 py-1 rounded-full text-xs {{ $banner->is_active ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-500' }}">
                {{ $banner->is_active ? 'Active' : 'Inactive' }}
            </span>
            <div class="flex gap-2 mt-3">
                <a href="{{ route('admin.banners.edit', $banner) }}" class="text-xs px-3 py-1 border border-gray-300 rounded hover:bg-gray-50">Edit</a>
                <form method="POST" action="{{ route('admin.banners.destroy', $banner) }}" onsubmit="return confirm('Delete?')">
                    @csrf @method('DELETE')
                    <button class="text-xs px-3 py-1 border border-red-400 text-red-600 rounded hover:bg-red-50">Delete</button>
                </form>
            </div>
        </div>
    </div>
    @empty
    <p class="text-gray-400 col-span-3 text-center py-10">No banners yet.</p>
    @endforelse
</div>
@endsection