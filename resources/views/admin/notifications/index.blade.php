@extends('layouts.admin')
@section('title', 'Notifications')

@section('content')
<div class="grid lg:grid-cols-3 gap-6">

    {{-- Notification List --}}
    <div class="lg:col-span-2 card overflow-hidden">
        <div class="px-5 py-4 border-b border-surface-100 flex items-center gap-2">
            <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M14.857 17.082a23.848 23.848 0 0 0 5.454-1.31A8.967 8.967 0 0 1 18 9.75V9A6 6 0 0 0 6 9v.75a8.967 8.967 0 0 1-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 0 1-5.714 0m5.714 0a3 3 0 1 1-5.714 0"/></svg>
            <span class="font-semibold text-surface-700">Sent Notifications</span>
        </div>
        <div class="divide-y divide-surface-100 max-h-[600px] overflow-y-auto">
            @forelse($notifications as $n)
            <div class="px-5 py-4 hover:bg-surface-50 transition-colors">
                <div class="flex justify-between items-start">
                    <div>
                        <p class="font-medium text-sm text-surface-800">{{ $n->title }}</p>
                        <p class="text-sm text-surface-500 mt-0.5">{{ $n->body }}</p>
                    </div>
                    <span class="text-xs text-surface-400 whitespace-nowrap ml-4">{{ $n->created_at->diffForHumans() }}</span>
                </div>
                @if($n->user_id === null)
                <span class="inline-flex items-center mt-1.5 px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 bg-violet-50 text-violet-700 ring-violet-200">Broadcast</span>
                @endif
            </div>
            @empty
            <p class="px-5 py-8 text-center text-surface-400">No notifications sent yet.</p>
            @endforelse
        </div>
        <div class="px-5 py-4 border-t border-surface-100">{{ $notifications->links() }}</div>
    </div>

    {{-- Send Notification Form --}}
    <div class="card p-6 space-y-4 self-start">
        <div class="flex items-center gap-2">
            <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M6 12 3.269 3.125A59.769 59.769 0 0 1 21.485 12 59.768 59.768 0 0 1 3.27 20.875L5.999 12Zm0 0h7.5"/></svg>
            <h3 class="font-display font-semibold text-surface-700">Send Notification</h3>
        </div>
        <form method="POST" action="{{ route('admin.notifications.send') }}" class="space-y-4">
            @csrf

            <div>
                <label class="block text-sm font-medium text-surface-700 mb-1">To</label>
                <select name="user_id" class="input w-full">
                    <option value="">All Users (Broadcast)</option>
                    @foreach($users as $u)
                    <option value="{{ $u->id }}">{{ $u->name }}</option>
                    @endforeach
                </select>
            </div>

            <div>
                <label class="block text-sm font-medium text-surface-700 mb-1">Title</label>
                <input name="title" required value="{{ old('title') }}" class="input w-full">
            </div>

            <div>
                <label class="block text-sm font-medium text-surface-700 mb-1">Message</label>
                <textarea name="body" rows="3" required class="input w-full">{{ old('body') }}</textarea>
            </div>

            <button type="submit" class="btn-primary w-full justify-center">Send Notification</button>
        </form>
    </div>
</div>
@endsection