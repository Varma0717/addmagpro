@extends('layouts.admin')
@section('title', 'Categories')

@section('content')
<div class="flex items-center justify-between mb-6">
    <div class="flex items-center gap-2">
        <svg class="w-5 h-5 text-brand-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6A2.25 2.25 0 0 1 6 3.75h2.25A2.25 2.25 0 0 1 10.5 6v2.25a2.25 2.25 0 0 1-2.25 2.25H6a2.25 2.25 0 0 1-2.25-2.25V6ZM3.75 15.75A2.25 2.25 0 0 1 6 13.5h2.25a2.25 2.25 0 0 1 2.25 2.25V18a2.25 2.25 0 0 1-2.25 2.25H6A2.25 2.25 0 0 1 3.75 18v-2.25ZM13.5 6a2.25 2.25 0 0 1 2.25-2.25H18A2.25 2.25 0 0 1 20.25 6v2.25A2.25 2.25 0 0 1 18 10.5h-2.25a2.25 2.25 0 0 1-2.25-2.25V6ZM13.5 15.75a2.25 2.25 0 0 1 2.25-2.25H18a2.25 2.25 0 0 1 2.25 2.25V18A2.25 2.25 0 0 1 18 20.25h-2.25a2.25 2.25 0 0 1-2.25-2.25v-2.25Z"/></svg>
        <h2 class="text-lg font-display font-semibold text-surface-700">All Categories</h2>
    </div>
    <a href="{{ route('admin.categories.create') }}" class="btn-primary btn-sm">
        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15"/></svg>
        Add Category
    </a>
</div>

<div class="card overflow-hidden">
    <table class="w-full text-sm">
        <thead>
            <tr>
                <th class="table-header">Image</th>
                <th class="table-header">Name</th>
                <th class="table-header">Type</th>
                <th class="table-header">Parent</th>
                <th class="table-header">Active</th>
                <th class="table-header">Actions</th>
            </tr>
        </thead>
        <tbody class="divide-y divide-surface-100">
            @forelse($categories as $category)
            <tr class="hover:bg-surface-50 transition-colors">
                <td class="table-cell">
                    @if($category->image)
                    <img src="{{ Storage::url($category->image) }}" class="w-10 h-10 rounded-lg object-cover ring-1 ring-surface-200">
                    @else
                    <div class="w-10 h-10 rounded-lg bg-surface-100 flex items-center justify-center text-surface-400">
                        <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="m2.25 15.75 5.159-5.159a2.25 2.25 0 0 1 3.182 0l5.159 5.159m-1.5-1.5 1.409-1.409a2.25 2.25 0 0 1 3.182 0l2.909 2.909M3.75 21h16.5a.375.375 0 0 0 .375-.375V3.375A.375.375 0 0 0 20.25 3H3.75a.375.375 0 0 0-.375.375v17.25c0 .207.168.375.375.375Z"/></svg>
                    </div>
                    @endif
                </td>
                <td class="table-cell font-medium text-surface-800">{{ $category->name }}</td>
                <td class="table-cell">
                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 {{ $category->type === 'ecommerce' ? 'bg-blue-50 text-blue-700 ring-blue-200' : 'bg-emerald-50 text-emerald-700 ring-emerald-200' }}">
                        {{ ucfirst($category->type) }}
                    </span>
                </td>
                <td class="table-cell text-surface-500">{{ $category->parent->name ?? '—' }}</td>
                <td class="table-cell">
                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ring-1 {{ $category->is_active ? 'bg-emerald-50 text-emerald-700 ring-emerald-200' : 'bg-surface-50 text-surface-500 ring-surface-200' }}">
                        {{ $category->is_active ? 'Yes' : 'No' }}
                    </span>
                </td>
                <td class="table-cell">
                    <div class="flex gap-2">
                        <a href="{{ route('admin.categories.edit', $category) }}" class="btn-ghost btn-sm">
                            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10"/></svg>
                            Edit
                        </a>
                        <form method="POST" action="{{ route('admin.categories.destroy', $category) }}" onsubmit="return confirm('Delete this category?')">
                            @csrf @method('DELETE')
                            <button class="btn-danger btn-sm">
                                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0"/></svg>
                                Delete
                            </button>
                        </form>
                    </div>
                </td>
            </tr>
            @empty
            <tr>
                <td colspan="6" class="table-cell text-center text-surface-400 py-8">No categories yet.</td>
            </tr>
            @endforelse
        </tbody>
    </table>
</div>
@endsection