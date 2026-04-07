@extends('layouts.admin')
@section('title', 'Listing: ' . $listing->business_name)

@section('content')
<div class="max-w-3xl space-y-6">
    <div class="bg-white rounded-xl shadow-sm border p-6">
        <div class="flex items-start justify-between mb-4">
            <div>
                <h2 class="text-xl font-bold text-gray-800">{{ $listing->business_name }}</h2>
                <p class="text-sm text-gray-500">{{ $listing->category->name ?? '—' }} &bull; {{ $listing->city }}, {{ $listing->state }}</p>
            </div>
            <span class="px-3 py-1 rounded-full text-sm
                {{ match($listing->status) {
                    'approved' => 'bg-green-100 text-green-700',
                    'pending'  => 'bg-yellow-100 text-yellow-700',
                    'rejected' => 'bg-red-100 text-red-700',
                    default    => 'bg-gray-100 text-gray-600',
                } }}">
                {{ ucfirst($listing->status) }}
            </span>
        </div>

        <div class="grid md:grid-cols-2 gap-4 text-sm">
            <div><span class="font-medium">Owner:</span> {{ $listing->user->name ?? '—' }}</div>
            <div><span class="font-medium">Phone:</span> {{ $listing->phone }}</div>
            <div><span class="font-medium">Email:</span> {{ $listing->email ?? '—' }}</div>
            <div><span class="font-medium">Website:</span> {{ $listing->website ?? '—' }}</div>
            <div class="md:col-span-2"><span class="font-medium">Address:</span> {{ $listing->address }}</div>
            <div class="md:col-span-2"><span class="font-medium">Description:</span> {{ $listing->description }}</div>
        </div>

        @if($listing->images->count())
        <div class="flex gap-3 flex-wrap mt-4">
            @foreach($listing->images as $img)
            <img src="{{ Storage::url($img->image_path) }}" class="w-24 h-24 object-cover rounded-lg border">
            @endforeach
        </div>
        @endif

        @if($listing->status === 'pending')
        <div class="flex gap-3 mt-6">
            <form method="POST" action="{{ route('admin.listings.approve', $listing) }}">
                @csrf
                <button class="px-5 py-2 bg-green-500 text-white rounded-lg text-sm hover:bg-green-600">Approve</button>
            </form>
            <form method="POST" action="{{ route('admin.listings.reject', $listing) }}">
                @csrf
                <button class="px-5 py-2 bg-yellow-500 text-white rounded-lg text-sm hover:bg-yellow-600">Reject</button>
            </form>
        </div>
        @endif
    </div>

    <!-- Reviews -->
    <div class="bg-white rounded-xl shadow-sm border overflow-hidden">
        <div class="px-5 py-4 border-b font-semibold text-gray-700">Reviews</div>
        <div class="divide-y">
            @forelse($listing->reviews as $review)
            <div class="px-5 py-4">
                <div class="flex items-center gap-2 mb-1">
                    <span class="font-medium text-sm">{{ $review->user->name ?? 'User' }}</span>
                    <span class="text-yellow-500 text-sm">{{ str_repeat('★', $review->rating) }}{{ str_repeat('☆', 5 - $review->rating) }}</span>
                </div>
                <p class="text-sm text-gray-600">{{ $review->comment }}</p>
            </div>
            @empty
            <p class="px-5 py-4 text-gray-400 text-sm">No reviews yet.</p>
            @endforelse
        </div>
    </div>
</div>
@endsection