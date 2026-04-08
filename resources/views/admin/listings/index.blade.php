@extends('layouts.admin')
@section('title', 'Service Listings')

@section('content')
<div class="flex items-center justify-between mb-6">
    <div class="flex items-center gap-2">
        <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M13.5 21v-7.5a.75.75 0 0 1 .75-.75h3a.75.75 0 0 1 .75.75V21m-4.5 0H2.36m11.14 0H18m0 0h3.64m-1.39 0V9.349M3.75 21V9.349m0 0a3.001 3.001 0 0 0 3.75-.615A2.993 2.993 0 0 0 9.75 9.75c.896 0 1.7-.393 2.25-1.016a2.993 2.993 0 0 0 2.25 1.016c.896 0 1.7-.393 2.25-1.015a3.001 3.001 0 0 0 3.75.614m-16.5 0a3.004 3.004 0 0 1-.621-4.72l1.189-1.19A1.5 1.5 0 0 1 5.378 3h13.243a1.5 1.5 0 0 1 1.06.44l1.19 1.189a3 3 0 0 1-.621 4.72M6.75 18h3.75a.75.75 0 0 0 .75-.75V13.5a.75.75 0 0 0-.75-.75H6.75a.75.75 0 0 0-.75.75v3.75c0 .414.336.75.75.75Z"/></svg>
        <h2 class="text-lg font-display font-semibold text-surface-700">Service Listings</h2>
    </div>
    <div class="flex gap-2">
        @foreach(['all','pending','approved','rejected'] as $f)
        <a href="{{ request()->fullUrlWithQuery(['filter' => $f]) }}"
            class="px-3 py-1.5 rounded-lg text-sm capitalize font-medium ring-1 transition-colors
               {{ request('filter', 'all') === $f ? 'bg-brand-500 text-white ring-brand-500 shadow-soft' : 'ring-surface-200 text-surface-600 hover:bg-surface-50' }}">
            {{ $f }}
        </a>
        @endforeach
    </div>
</div>

<div class="card overflow-hidden">
    <table class="w-full text-sm">
        <thead>
            <tr>
                <th class="table-header">Business</th>
                <th class="table-header">Category</th>
                <th class="table-header">Owner</th>
                <th class="table-header">City</th>
                <th class="table-header">Status</th>
                <th class="table-header">Actions</th>
            </tr>
        </thead>
        <tbody class="divide-y divide-surface-100">
            @forelse($listings as $listing)
            <tr class="hover:bg-surface-50 transition-colors">
                <td class="table-cell font-medium">
                    <a href="{{ route('admin.listings.show', $listing) }}" class="text-brand-600 hover:text-brand-700">{{ $listing->business_name }}</a>
                </td>
                <td class="table-cell text-surface-500">{{ $listing->category->name ?? '—' }}</td>
                <td class="table-cell text-surface-500">{{ $listing->user->name ?? '—' }}</td>
                <td class="table-cell text-surface-500">{{ $listing->city }}</td>
                <td class="table-cell">
                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1
                            {{ match($listing->status) {
                                'approved' => 'bg-emerald-50 text-emerald-700 ring-emerald-200',
                                'pending'  => 'bg-amber-50 text-amber-700 ring-amber-200',
                                'rejected' => 'bg-red-50 text-red-700 ring-red-200',
                                default    => 'bg-surface-50 text-surface-600 ring-surface-200',
                            } }}">
                        {{ ucfirst($listing->status) }}
                    </span>
                </td>
                <td class="table-cell">
                    <div class="flex gap-1.5">
                        @if($listing->status === 'pending')
                        <form method="POST" action="{{ route('admin.listings.approve', $listing) }}">
                            @csrf
                            <button class="btn-sm inline-flex items-center gap-1 px-2.5 py-1 text-xs font-medium rounded-lg ring-1 ring-emerald-200 text-emerald-700 bg-emerald-50 hover:bg-emerald-100 transition-colors">
                                <svg class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5"/></svg>
                                Approve
                            </button>
                        </form>
                        <form method="POST" action="{{ route('admin.listings.reject', $listing) }}">
                            @csrf
                            <button class="btn-sm inline-flex items-center gap-1 px-2.5 py-1 text-xs font-medium rounded-lg ring-1 ring-amber-200 text-amber-700 bg-amber-50 hover:bg-amber-100 transition-colors">
                                <svg class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12"/></svg>
                                Reject
                            </button>
                        </form>
                        @endif
                        <form method="POST" action="{{ route('admin.listings.destroy', $listing) }}" onsubmit="return confirm('Delete listing?')">
                            @csrf @method('DELETE')
                            <button class="btn-danger btn-sm">
                                <svg class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0"/></svg>
                                Delete
                            </button>
                        </form>
                    </div>
                </td>
            </tr>
            @empty
            <tr>
                <td colspan="6" class="table-cell text-center text-surface-400 py-8">No listings found.</td>
            </tr>
            @endforelse
        </tbody>
    </table>
    <div class="px-5 py-4 border-t border-surface-100">{{ $listings->withQueryString()->links() }}</div>
</div>
@endsection