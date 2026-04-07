@extends('layouts.admin')
@section('title', 'Service Listings')

@section('content')
<div class="flex items-center justify-between mb-6">
    <h2 class="text-lg font-semibold text-gray-700">Service Listings</h2>
    <div class="flex gap-2">
        @foreach(['all','pending','approved','rejected'] as $f)
        <a href="{{ request()->fullUrlWithQuery(['filter' => $f]) }}"
            class="px-3 py-1.5 rounded-lg text-sm capitalize border
               {{ request('filter', 'all') === $f ? 'bg-orange-500 text-white border-orange-500' : 'border-gray-300 hover:bg-gray-50' }}">
            {{ $f }}
        </a>
        @endforeach
    </div>
</div>

<div class="bg-white rounded-xl shadow-sm border overflow-hidden">
    <table class="w-full text-sm">
        <thead class="bg-gray-50 text-gray-500 text-xs uppercase">
            <tr>
                <th class="px-4 py-3 text-left">Business</th>
                <th class="px-4 py-3 text-left">Category</th>
                <th class="px-4 py-3 text-left">Owner</th>
                <th class="px-4 py-3 text-left">City</th>
                <th class="px-4 py-3 text-left">Status</th>
                <th class="px-4 py-3 text-left">Actions</th>
            </tr>
        </thead>
        <tbody class="divide-y">
            @forelse($listings as $listing)
            <tr class="hover:bg-gray-50">
                <td class="px-4 py-3 font-medium">
                    <a href="{{ route('admin.listings.show', $listing) }}" class="text-orange-600 hover:underline">{{ $listing->business_name }}</a>
                </td>
                <td class="px-4 py-3 text-gray-500">{{ $listing->category->name ?? '—' }}</td>
                <td class="px-4 py-3 text-gray-500">{{ $listing->user->name ?? '—' }}</td>
                <td class="px-4 py-3 text-gray-500">{{ $listing->city }}</td>
                <td class="px-4 py-3">
                    <span class="px-2 py-1 rounded-full text-xs
                            {{ match($listing->status) {
                                'approved' => 'bg-green-100 text-green-700',
                                'pending'  => 'bg-yellow-100 text-yellow-700',
                                'rejected' => 'bg-red-100 text-red-700',
                                default    => 'bg-gray-100 text-gray-600',
                            } }}">
                        {{ ucfirst($listing->status) }}
                    </span>
                </td>
                <td class="px-4 py-3 flex gap-1.5">
                    @if($listing->status === 'pending')
                    <form method="POST" action="{{ route('admin.listings.approve', $listing) }}">
                        @csrf
                        <button class="text-xs px-3 py-1 border border-green-400 text-green-600 rounded hover:bg-green-50">Approve</button>
                    </form>
                    <form method="POST" action="{{ route('admin.listings.reject', $listing) }}">
                        @csrf
                        <button class="text-xs px-3 py-1 border border-yellow-400 text-yellow-700 rounded hover:bg-yellow-50">Reject</button>
                    </form>
                    @endif
                    <form method="POST" action="{{ route('admin.listings.destroy', $listing) }}" onsubmit="return confirm('Delete listing?')">
                        @csrf @method('DELETE')
                        <button class="text-xs px-3 py-1 border border-red-400 text-red-600 rounded hover:bg-red-50">Delete</button>
                    </form>
                </td>
            </tr>
            @empty
            <tr>
                <td colspan="6" class="px-4 py-8 text-center text-gray-400">No listings found.</td>
            </tr>
            @endforelse
        </tbody>
    </table>
    <div class="px-5 py-4 border-t">{{ $listings->withQueryString()->links() }}</div>
</div>
@endsection