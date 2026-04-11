@extends('layouts.app')
@section('title', $listing->business_name)

@section('content')
{{-- Breadcrumb --}}
<nav class="flex items-center gap-2 text-sm text-surface-400 mb-6">
    <a href="{{ route('home') }}" class="hover:text-brand-500 transition-colors">Home</a>
    <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
    </svg>
    <a href="{{ route('categories.show', $listing->category->slug) }}" class="hover:text-brand-500 transition-colors">{{ $listing->category->name }}</a>
    <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
    </svg>
    <span class="text-surface-700 font-medium truncate">{{ $listing->business_name }}</span>
</nav>

<div class="grid md:grid-cols-3 gap-8 lg:gap-10 mb-12" data-animate>
    {{-- Main info --}}
    <div class="md:col-span-2">
        @if($listing->images->count())
        <div class="grid grid-cols-3 gap-3 mb-8">
            @foreach($listing->images->take(6) as $img)
            <img src="{{ imageUrl($img->image_path) }}" alt="" class="rounded-2xl object-cover aspect-video w-full shadow-sm hover:shadow-card transition-shadow duration-300">
            @endforeach
        </div>
        @endif

        <h1 class="font-display text-2xl lg:text-3xl font-bold text-surface-900 mb-2">{{ $listing->business_name }}</h1>
        <p class="text-surface-500 mb-4 flex items-center gap-2">
            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 11-6 0 3 3 0 016 0z" />
                <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1115 0z" />
            </svg>
            {{ $listing->category->name }} &bull; {{ $listing->city }}, {{ $listing->state }}
        </p>

        @if($listing->reviews->count())
        <div class="flex items-center gap-3 mb-6">
            <div class="flex items-center gap-0.5">
                @for($i = 1; $i <= 5; $i++)
                    <svg class="w-5 h-5 {{ $i <= round($listing->reviews->avg('rating')) ? 'text-amber-400' : 'text-surface-200' }}" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
                    @endfor
            </div>
            <span class="text-sm font-semibold text-surface-700">{{ number_format($listing->reviews->avg('rating'), 1) }}</span>
            <span class="text-sm text-surface-400">({{ $listing->reviews->count() }} reviews)</span>
        </div>
        @endif

        <div class="card p-6 mb-8">
            <h2 class="font-semibold text-surface-800 mb-3 flex items-center gap-2">
                <svg class="w-5 h-5 text-surface-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M11.25 11.25l.041-.02a.75.75 0 011.063.852l-.708 2.836a.75.75 0 001.063.853l.041-.021M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9-3.75h.008v.008H12V8.25z" />
                </svg>
                About
            </h2>
            <p class="text-surface-600 leading-relaxed">{{ $listing->description }}</p>
        </div>

        {{-- Reviews --}}
        <h2 class="section-title mb-5">Reviews</h2>

        @auth
        <form method="POST" action="{{ route('listings.review', $listing->slug) }}" class="card p-6 mb-6">
            @csrf
            <div class="flex gap-1.5 mb-4" x-data="{ rating: 0 }">
                @for($i = 1; $i <= 5; $i++)
                    <button type="button" @click="rating = {{ $i }}"
                    :class="rating >= {{ $i }} ? 'text-amber-400 scale-110' : 'text-surface-200'"
                    class="transition-all duration-200 hover:scale-110">
                    <svg class="w-8 h-8" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                    </svg>
                    </button>
                    <input type="hidden" name="rating" :value="rating">
                    @endfor
            </div>
            <textarea name="comment" rows="2" placeholder="Share your experience…" class="input mb-4"></textarea>
            <button class="btn-primary">Submit Review</button>
        </form>
        @endauth

        <div class="space-y-4">
            @forelse($listing->reviews as $review)
            <div class="card p-5">
                <div class="flex items-center gap-3 mb-3">
                    <div class="w-9 h-9 rounded-full bg-gradient-to-br from-blue-400 to-blue-600 text-white font-bold text-sm flex items-center justify-center">
                        {{ strtoupper(substr($review->user->name ?? 'U', 0, 1)) }}
                    </div>
                    <div>
                        <p class="text-sm font-semibold text-surface-800">{{ $review->user->name ?? 'User' }}</p>
                        <div class="flex items-center gap-0.5 mt-0.5">
                            @for($s = 1; $s <= 5; $s++)
                                <svg class="w-3 h-3 {{ $s <= $review->rating ? 'text-amber-400' : 'text-surface-200' }}" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
                                @endfor
                        </div>
                    </div>
                    <span class="ml-auto text-xs text-surface-400">{{ $review->created_at->diffForHumans() }}</span>
                </div>
                <p class="text-sm text-surface-600 leading-relaxed">{{ $review->comment }}</p>
            </div>
            @empty
            <p class="text-surface-400 text-sm text-center py-8">No reviews yet.</p>
            @endforelse
        </div>
    </div>

    {{-- Contact sidebar --}}
    <div class="space-y-5 sticky top-24">
        <div class="card p-6">
            <h3 class="font-semibold text-surface-800 mb-5 flex items-center gap-2">
                <svg class="w-5 h-5 text-surface-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 6.75c0 8.284 6.716 15 15 15h2.25a2.25 2.25 0 002.25-2.25v-1.372c0-.516-.351-.966-.852-1.091l-4.423-1.106c-.44-.11-.902.055-1.173.417l-.97 1.293c-.282.376-.769.542-1.21.38a12.035 12.035 0 01-7.143-7.143c-.162-.441.004-.928.38-1.21l1.293-.97c.363-.271.527-.734.417-1.173L6.963 3.102a1.125 1.125 0 00-1.091-.852H4.5A2.25 2.25 0 002.25 4.5v2.25z" />
                </svg>
                Contact
            </h3>
            @if($listing->phone)
            <a href="tel:{{ $listing->phone }}"
                class="flex items-center gap-3 w-full py-3 bg-emerald-500 text-white rounded-xl font-medium justify-center hover:bg-emerald-600 transition-colors mb-3">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 6.75c0 8.284 6.716 15 15 15h2.25a2.25 2.25 0 002.25-2.25v-1.372c0-.516-.351-.966-.852-1.091l-4.423-1.106c-.44-.11-.902.055-1.173.417l-.97 1.293c-.282.376-.769.542-1.21.38a12.035 12.035 0 01-7.143-7.143c-.162-.441.004-.928.38-1.21l1.293-.97c.363-.271.527-.734.417-1.173L6.963 3.102a1.125 1.125 0 00-1.091-.852H4.5A2.25 2.25 0 002.25 4.5v2.25z" />
                </svg>
                Call {{ $listing->phone }}
            </a>
            <a href="https://wa.me/91{{ preg_replace('/\D/', '', $listing->phone) }}?text={{ urlencode('Hi! I found your business on AddMagPro: '.$listing->business_name) }}"
                target="_blank" rel="noopener noreferrer"
                class="flex items-center gap-3 w-full py-3 bg-green-600 text-white rounded-xl font-medium justify-center hover:bg-green-700 transition-colors mb-3">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z" />
                </svg>
                WhatsApp
            </a>
            @endif
            @if($listing->email)
            <a href="mailto:{{ $listing->email }}" class="flex items-center gap-3 w-full py-3 border border-surface-200 rounded-xl text-sm text-surface-600 justify-center hover:bg-surface-50 transition-colors">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75" />
                </svg>
                {{ $listing->email }}
            </a>
            @endif
        </div>

        <div class="card p-6 text-sm">
            <h3 class="font-semibold text-surface-800 mb-4 flex items-center gap-2">
                <svg class="w-5 h-5 text-surface-400" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 11-6 0 3 3 0 016 0z" />
                    <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1115 0z" />
                </svg>
                Address
            </h3>
            <p class="text-surface-600">{{ $listing->address }}</p>
            <p class="text-surface-600 mt-1">{{ $listing->city }}, {{ $listing->state }} {{ $listing->pincode }}</p>
            @if($listing->website)
            <a href="{{ $listing->website }}" target="_blank" rel="noopener noreferrer" class="text-brand-500 hover:text-brand-600 break-all mt-3 inline-flex items-center gap-1 transition-colors">
                <svg class="w-4 h-4 flex-shrink-0" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M13.19 8.688a4.5 4.5 0 011.242 7.244l-4.5 4.5a4.5 4.5 0 01-6.364-6.364l1.757-1.757m9.86-2.54a4.5 4.5 0 00-1.242-7.244l-4.5-4.5a4.5 4.5 0 00-6.364 6.364L5.757 8.688" />
                </svg>
                {{ $listing->website }}
            </a>
            @endif
        </div>
    </div>
</div>
@endsection