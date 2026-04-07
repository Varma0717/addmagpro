<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ServiceListing;
use Illuminate\Http\Request;

class ListingController extends Controller
{
    public function index(Request $request)
    {
        $listings = ServiceListing::with('user', 'category')
            ->when($request->search, fn($q) => $q->where('business_name', 'like', "%{$request->search}%"))
            ->when($request->status === 'pending', fn($q) => $q->where('is_approved', false))
            ->when($request->status === 'approved', fn($q) => $q->where('is_approved', true))
            ->latest()
            ->paginate(20);

        return view('admin.listings.index', compact('listings'));
    }

    public function show(ServiceListing $listing)
    {
        $listing->load('user', 'category', 'images', 'reviews.user');
        return view('admin.listings.show', compact('listing'));
    }

    public function approve(ServiceListing $listing)
    {
        $listing->update(['is_approved' => true]);
        return back()->with('success', 'Listing approved.');
    }

    public function reject(ServiceListing $listing)
    {
        $listing->update(['is_approved' => false]);
        return back()->with('success', 'Listing rejected.');
    }

    public function destroy(ServiceListing $listing)
    {
        $listing->delete();
        return redirect()->route('admin.listings.index')->with('success', 'Listing deleted.');
    }
}
