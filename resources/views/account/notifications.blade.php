@extends('layouts.account')
@section('page_title', 'Notifications')
@section('title', 'Notifications')

@section('account_content')
<h2 class="text-xl font-bold font-display text-surface-800 mb-5 flex items-center gap-2">
    <svg class="w-6 h-6 text-brand-500" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" d="M14.857 17.082a23.848 23.848 0 0 0 5.454-1.31A8.967 8.967 0 0 1 18 9.75V9A6 6 0 0 0 6 9v.75a8.967 8.967 0 0 1-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 0 1-5.714 0m5.714 0a3 3 0 1 1-5.714 0" />
    </svg>
    Notifications
</h2>

<div class="card overflow-hidden">
    @if($notifications->isEmpty())
    <div class="px-6 py-16 text-center">
        <svg class="w-12 h-12 text-surface-300 mx-auto mb-3" fill="none" stroke="currentColor" stroke-width="1" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M14.857 17.082a23.848 23.848 0 0 0 5.454-1.31A8.967 8.967 0 0 1 18 9.75V9A6 6 0 0 0 6 9v.75a8.967 8.967 0 0 1-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 0 1-5.714 0m5.714 0a3 3 0 1 1-5.714 0" />
        </svg>
        <p class="text-surface-400">No notifications yet.</p>
    </div>
    @else
    <div class="divide-y divide-surface-100">
        @foreach($notifications as $notif)
        <div class="flex gap-4 px-6 py-4 {{ !$notif->read_at ? 'bg-brand-50/50' : '' }}">
            <div class="w-9 h-9 bg-brand-100 text-brand-500 rounded-full flex items-center justify-center flex-shrink-0">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M14.857 17.082a23.848 23.848 0 0 0 5.454-1.31A8.967 8.967 0 0 1 18 9.75V9A6 6 0 0 0 6 9v.75a8.967 8.967 0 0 1-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 0 1-5.714 0m5.714 0a3 3 0 1 1-5.714 0" />
                </svg>
            </div>
            <div class="flex-1 min-w-0">
                <p class="font-semibold text-sm text-surface-800">{{ $notif->title }}</p>
                <p class="text-sm text-surface-500 mt-0.5">{{ $notif->body }}</p>
                <p class="text-xs text-surface-400 mt-1.5">{{ $notif->created_at->diffForHumans() }}</p>
            </div>
            @if(!$notif->read_at)
            <div class="w-2.5 h-2.5 bg-brand-500 rounded-full mt-2 flex-shrink-0 ring-2 ring-brand-100"></div>
            @endif
        </div>
        @endforeach
    </div>
    <div class="px-6 py-4 border-t border-surface-100">{{ $notifications->links() }}</div>
    @endif
</div>
@endsection