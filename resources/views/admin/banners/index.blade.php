@extends('layouts.admin')
@section('title', 'Banners')

@section('content')
<div class="flex items-center justify-between mb-6">
    <div class="flex items-center gap-2">
        <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" d="m2.25 15.75 5.159-5.159a2.25 2.25 0 0 1 3.182 0l5.159 5.159m-1.5-1.5 1.409-1.409a2.25 2.25 0 0 1 3.182 0l2.909 2.909M3.75 21h16.5A2.25 2.25 0 0 0 22.5 18.75V5.25A2.25 2.25 0 0 0 20.25 3H3.75A2.25 2.25 0 0 0 1.5 5.25v13.5A2.25 2.25 0 0 0 3.75 21ZM8.25 8.625a1.125 1.125 0 1 0 0 2.25 1.125 1.125 0 0 0 0-2.25Z" />
        </svg>
        <h2 class="font-display text-lg font-semibold text-surface-800">Banners</h2>
    </div>
    <a href="{{ route('admin.banners.create') }}" class="btn-primary">
        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
        </svg>
        Add Banner
    </a>
</div>

<div class="grid md:grid-cols-2 lg:grid-cols-3 gap-5">
    @forelse($banners as $banner)
    <div class="card overflow-hidden group">
        <div class="relative overflow-hidden">
            <img src="{{ imageUrl($banner->image_path) }}" class="w-full h-40 object-cover transition-transform duration-300 group-hover:scale-105">
        </div>
        <div class="p-4 space-y-2">
            <div class="font-medium text-surface-800">{{ $banner->title ?? 'No title' }}</div>
            <div class="text-xs text-surface-500">Placement: <span class="font-medium">{{ $banner->placement }}</span></div>
            @if($banner->starts_at)
            <div class="text-xs text-surface-400">{{ $banner->starts_at->format('d M') }} – {{ $banner->ends_at?->format('d M Y') }}</div>
            @endif
            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 {{ $banner->is_active ? 'bg-emerald-50 text-emerald-700 ring-emerald-200' : 'bg-surface-50 text-surface-500 ring-surface-200' }}">
                {{ $banner->is_active ? 'Active' : 'Inactive' }}
            </span>
            <div class="flex gap-2 pt-2">
                <a href="{{ route('admin.banners.edit', $banner) }}" class="btn-ghost btn-sm">
                    <svg class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125" />
                    </svg>
                    Edit
                </a>
                <form method="POST" action="{{ route('admin.banners.destroy', $banner) }}" onsubmit="return confirm('Delete this banner?')">
                    @csrf @method('DELETE')
                    <button class="btn-danger btn-sm">
                        <svg class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />
                        </svg>
                        Delete
                    </button>
                </form>
            </div>
        </div>
    </div>
    @empty
    <p class="text-surface-400 col-span-3 text-center py-10">No banners yet.</p>
    @endforelse
</div>
@endsection