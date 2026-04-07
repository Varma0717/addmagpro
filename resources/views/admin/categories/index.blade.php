@extends('layouts.admin')
@section('title', 'Categories')

@section('content')
<div class="flex items-center justify-between mb-6">
    <h2 class="text-lg font-semibold text-gray-700">All Categories</h2>
    <a href="{{ route('admin.categories.create') }}" class="px-4 py-2 bg-orange-500 text-white rounded-lg text-sm hover:bg-orange-600">+ Add Category</a>
</div>

<div class="bg-white rounded-xl shadow-sm border overflow-hidden">
    <table class="w-full text-sm">
        <thead class="bg-gray-50 text-gray-500 text-xs uppercase">
            <tr>
                <th class="px-4 py-3 text-left">Image</th>
                <th class="px-4 py-3 text-left">Name</th>
                <th class="px-4 py-3 text-left">Type</th>
                <th class="px-4 py-3 text-left">Parent</th>
                <th class="px-4 py-3 text-left">Active</th>
                <th class="px-4 py-3 text-left">Actions</th>
            </tr>
        </thead>
        <tbody class="divide-y">
            @forelse($categories as $category)
            <tr class="hover:bg-gray-50">
                <td class="px-4 py-3">
                    @if($category->image)
                    <img src="{{ Storage::url($category->image) }}" class="w-10 h-10 rounded-lg object-cover">
                    @else
                    <div class="w-10 h-10 rounded-lg bg-gray-100 flex items-center justify-center text-gray-400">—</div>
                    @endif
                </td>
                <td class="px-4 py-3 font-medium text-gray-800">{{ $category->name }}</td>
                <td class="px-4 py-3">
                    <span class="px-2 py-1 rounded-full text-xs {{ $category->type === 'ecommerce' ? 'bg-blue-100 text-blue-700' : 'bg-green-100 text-green-700' }}">
                        {{ ucfirst($category->type) }}
                    </span>
                </td>
                <td class="px-4 py-3 text-gray-500">{{ $category->parent->name ?? '—' }}</td>
                <td class="px-4 py-3">
                    <span class="px-2 py-1 rounded-full text-xs {{ $category->is_active ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-500' }}">
                        {{ $category->is_active ? 'Yes' : 'No' }}
                    </span>
                </td>
                <td class="px-4 py-3 flex gap-2">
                    <a href="{{ route('admin.categories.edit', $category) }}" class="text-xs px-3 py-1 border border-gray-300 rounded hover:bg-gray-50">Edit</a>
                    <form method="POST" action="{{ route('admin.categories.destroy', $category) }}" onsubmit="return confirm('Delete this category?')">
                        @csrf @method('DELETE')
                        <button class="text-xs px-3 py-1 border border-red-400 text-red-600 rounded hover:bg-red-50">Delete</button>
                    </form>
                </td>
            </tr>
            @empty
            <tr>
                <td colspan="6" class="px-4 py-8 text-center text-gray-400">No categories yet.</td>
            </tr>
            @endforelse
        </tbody>
    </table>
</div>
@endsection