@extends('layouts.admin')
@section('title', 'Notifications')

@section('content')
<div class="grid lg:grid-cols-3 gap-6">

    <!-- Notification list -->
    <div class="lg:col-span-2 bg-white rounded-xl shadow-sm border overflow-hidden">
        <div class="px-5 py-4 border-b font-semibold text-gray-700">Sent Notifications</div>
        <div class="divide-y max-h-[600px] overflow-y-auto">
            @forelse($notifications as $n)
            <div class="px-5 py-4">
                <div class="flex justify-between items-start">
                    <div>
                        <p class="font-medium text-sm text-gray-800">{{ $n->title }}</p>
                        <p class="text-sm text-gray-500 mt-0.5">{{ $n->body }}</p>
                    </div>
                    <span class="text-xs text-gray-400 whitespace-nowrap ml-4">{{ $n->created_at->diffForHumans() }}</span>
                </div>
                @if($n->user_id === null)
                <span class="text-xs bg-purple-100 text-purple-700 px-2 py-0.5 rounded-full mt-1 inline-block">Broadcast</span>
                @endif
            </div>
            @empty
            <p class="px-5 py-8 text-center text-gray-400">No notifications sent yet.</p>
            @endforelse
        </div>
        <div class="px-5 py-4 border-t">{{ $notifications->links() }}</div>
    </div>

    <!-- Send form -->
    <div class="bg-white rounded-xl shadow-sm border p-6 space-y-4 self-start">
        <h3 class="font-semibold text-gray-700">Send Notification</h3>
        <form method="POST" action="{{ route('admin.notifications.send') }}" class="space-y-4">
            @csrf

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">To</label>
                <select name="user_id" class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
                    <option value="">All Users (Broadcast)</option>
                    @foreach($users as $u)
                    <option value="{{ $u->id }}">{{ $u->name }}</option>
                    @endforeach
                </select>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Title</label>
                <input name="title" required value="{{ old('title') }}"
                    class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Message</label>
                <textarea name="body" rows="3" required
                    class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-orange-400">{{ old('body') }}</textarea>
            </div>

            <button type="submit" class="w-full px-4 py-2 bg-orange-500 text-white rounded-lg text-sm hover:bg-orange-600">Send Notification</button>
        </form>
    </div>
</div>
@endsection