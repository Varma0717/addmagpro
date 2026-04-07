<?php

namespace App\Http\Controllers;

use App\Models\ServiceListing;
use Illuminate\Http\Request;

class ListingController extends Controller
{
    public function show(ServiceListing $listing)
    {
        $listing->load('category', 'images', 'reviews.user');

        return view('listings.show', compact('listing'));
    }

    public function review(Request $request, ServiceListing $listing)
    {
        $request->validate([
            'rating'  => 'required|integer|between:1,5',
            'comment' => 'nullable|string|max:1000',
        ]);

        $listing->reviews()->updateOrCreate(
            ['user_id' => auth()->id()],
            ['rating' => $request->rating, 'comment' => $request->comment, 'is_approved' => false]
        );

        return back()->with('success', 'Review submitted — pending approval.');
    }
}
