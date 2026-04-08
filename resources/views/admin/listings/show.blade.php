@extends('layouts.admin')
@section('title', 'Listing: ' . $listing->business_name)

@section('content')
<div class="max-w-3xl space-y-6">
    <div class="card p-6">
        <div class="flex items-start justify-between mb-4">
            <div>
                <h2 class="text-xl font-display font-bold text-surface-800">{{ $listing->business_name }}</h2>
                <p class="text-sm text-surface-500">{{ $listing->category->name ?? '—' }} &bull; {{ $listing->city }}, {{ $listing->state }}</p>
            </div>
            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium ring-1
                {{ match($listing->status) {
                    'approved' => 'bg-emerald-50 text-emerald-700 ring-emerald-200',
                    'pending'  => 'bg-amber-50 text-amber-700 ring-amber-200',
                    'rejected' => 'bg-red-50 text-red-700 ring-red-200',
                    default    => 'bg-surface-50 text-surface-600 ring-surface-200',
                } }}">
                {{ ucfirst($listing->status) }}
            </span>
        </div>

        <div class="grid md:grid-cols-2 gap-4 text-sm">
            <div><span class="font-medium text-surface-700">Owner:</span> <span class="text-surface-600">{{ $listing->user->name ?? '—' }}</span></div>
            <div><span class="font-medium text-surface-700">Phone:</span> <span class="text-surface-600">{{ $listing->phone }}</span></div>
            <div><span class="font-medium text-surface-700">Email:</span> <span class="text-surface-600">{{ $listing->email ?? '—' }}</span></div>
            <div><span class="font-medium text-surface-700">Website:</span> <span class="text-surface-600">{{ $listing->website ?? '—' }}</span></div>
            <div class="md:col-span-2"><span class="font-medium text-surface-700">Address:</span> <span class="text-surface-600">{{ $listing->address }}</span></div>
            <div class="md:col-span-2"><span class="font-medium text-surface-700">Description:</span> <span class="text-surface-600">{{ $listing->description }}</span></div>
        </div>

        @if($listing->images->count())
        <div class="flex gap-3 flex-wrap mt-4">
            @foreach($listing->images as $img)
            <img src="{{ Storage::url($img->image_path) }}" class="w-24 h-24 object-cover rounded-lg ring-1 ring-surface-200">
            @endforeach
        </div>
        @endif

        @if($listing->status === 'pending')
        <div class="flex gap-3 mt-6">
            <form method="POST" action="{{ route('admin.listings.approve', $listing) }}">
                @csrf
                <button class="inline-flex items-center gap-1.5 px-5 py-2 bg-emerald-500 text-white rounded-lg text-sm font-medium hover:bg-emerald-600 transition-colors">
                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5"/></svg>
                    Approve
                </button>
            </form>
            <form method="POST" action="{{ route('admin.listings.reject', $listing) }}">
                @csrf
                <button class="inline-flex items-center gap-1.5 px-5 py-2 bg-amber-500 text-white rounded-lg text-sm font-medium hover:bg-amber-600 transition-colors">
                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12"/></svg>
                    Reject
                </button>
            </form>
        </div>
        @endif
    </div>

    {{-- Reviews --}}
    <div class="card overflow-hidden">
        <div class="px-5 py-4 border-b border-surface-100 flex items-center gap-2">
            <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 0 1 1.04 0l2.125 5.111a.563.563 0 0 0 .475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 0 0-.182.557l1.285 5.385a.562.562 0 0 1-.84.61l-4.725-2.885a.562.562 0 0 0-.586 0L6.982 20.54a.562.562 0 0 1-.84-.61l1.285-5.386a.562.562 0 0 0-.182-.557l-4.204-3.602a.562.562 0 0 1 .321-.988l5.518-.442a.563.563 0 0 0 .475-.345L11.48 3.5Z"/></svg>
            <span class="font-semibold text-surface-700">Reviews</span>
        </div>
        <div class="divide-y divide-surface-100">
            @forelse($listing->reviews as $review)
            <div class="px-5 py-4">
                <div class="flex items-center gap-2 mb-1">
                    <span class="font-medium text-sm text-surface-800">{{ $review->user->name ?? 'User' }}</span>
                    <div class="flex gap-0.5">
                        @for($i = 1; $i <= 5; $i++)
                        <svg class="w-4 h-4 {{ $i <= $review->rating ? 'text-amber-400' : 'text-surface-200' }}" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                        @endfor
                    </div>
                </div>
                <p class="text-sm text-surface-600">{{ $review->comment }}</p>
            </div>
            @empty
            <p class="px-5 py-4 text-surface-400 text-sm">No reviews yet.</p>
            @endforelse
        </div>
    </div>
</div>
@endsection