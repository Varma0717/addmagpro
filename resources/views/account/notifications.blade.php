@extends('layouts.account')
@section('page_title', 'Notifications')
@section('title', 'Notifications')

@section('account_content')
<h2 class="text-xl font-bold text-gray-800 mb-4">Notifications</h2>

<div class="bg-white rounded-xl border overflow-hidden">
    @if($notifications->isEmpty())
    <p class="px-5 py-12 text-center text-gray-400">No notifications yet.</p>
    @else
    <div class="divide-y">
        @foreach($notifications as $notif)
        <div class="flex gap-4 px-5 py-4 {{ !$notif->read_at ? 'bg-orange-50' : '' }}">
            <div class="w-8 h-8 bg-orange-100 text-orange-500 rounded-full flex items-center justify-center flex-shrink-0">🔔</div>
            <div class="flex-1">
                <p class="font-medium text-sm text-gray-800">{{ $notif->title }}</p>
                <p class="text-sm text-gray-500 mt-0.5">{{ $notif->body }}</p>
                <p class="text-xs text-gray-400 mt-1">{{ $notif->created_at->diffForHumans() }}</p>
            </div>
            @if(!$notif->read_at)
            <div class="w-2 h-2 bg-orange-500 rounded-full mt-2 flex-shrink-0"></div>
            @endif
        </div>
        @endforeach
    </div>
    <div class="px-5 py-4 border-t">{{ $notifications->links() }}</div>
    @endif
</div>
@endsection