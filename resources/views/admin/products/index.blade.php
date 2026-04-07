@extends('layouts.admin')
@section('title', 'Products')

@section('content')
<div class="flex items-center justify-between mb-6">
    <h2 class="text-lg font-semibold text-gray-700">All Products</h2>
    <a href="{{ route('admin.products.create') }}" class="px-4 py-2 bg-orange-500 text-white rounded-lg text-sm hover:bg-orange-600">+ Add Product</a>
</div>

<div class="bg-white rounded-xl shadow-sm border overflow-hidden">
    <table class="w-full text-sm">
        <thead class="bg-gray-50 text-gray-500 text-xs uppercase">
            <tr>
                <th class="px-4 py-3 text-left">Image</th>
                <th class="px-4 py-3 text-left">Name</th>
                <th class="px-4 py-3 text-left">Category</th>
                <th class="px-4 py-3 text-left">Price</th>
                <th class="px-4 py-3 text-left">Stock</th>
                <th class="px-4 py-3 text-left">Status</th>
                <th class="px-4 py-3 text-left">Actions</th>
            </tr>
        </thead>
        <tbody class="divide-y">
            @forelse($products as $product)
            <tr class="hover:bg-gray-50">
                <td class="px-4 py-3">
                    @php $img = $product->images->first(); @endphp
                    @if($img)
                    <img src="{{ Storage::url($img->image_path) }}" class="w-12 h-12 rounded-lg object-cover">
                    @else
                    <div class="w-12 h-12 rounded-lg bg-gray-100 flex items-center justify-center text-gray-400 text-lg">📦</div>
                    @endif
                </td>
                <td class="px-4 py-3 font-medium text-gray-800 max-w-[180px] truncate">{{ $product->name }}</td>
                <td class="px-4 py-3 text-gray-500">{{ $product->category->name ?? '—' }}</td>
                <td class="px-4 py-3">
                    <div class="font-medium">₹{{ number_format($product->effective_price, 2) }}</div>
                    @if($product->sale_price)
                    <div class="text-xs text-gray-400 line-through">₹{{ number_format($product->price, 2) }}</div>
                    @endif
                </td>
                <td class="px-4 py-3">
                    <span class="px-2 py-1 rounded-full text-xs {{ $product->stock_qty > 0 ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-600' }}">
                        {{ $product->stock_qty }}
                    </span>
                </td>
                <td class="px-4 py-3">
                    <span class="px-2 py-1 rounded-full text-xs {{ $product->is_active ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-500' }}">
                        {{ $product->is_active ? 'Active' : 'Inactive' }}
                    </span>
                </td>
                <td class="px-4 py-3 flex gap-2">
                    <a href="{{ route('admin.products.edit', $product) }}" class="text-xs px-3 py-1 border border-gray-300 rounded hover:bg-gray-50">Edit</a>
                    <form method="POST" action="{{ route('admin.products.destroy', $product) }}" onsubmit="return confirm('Delete product?')">
                        @csrf @method('DELETE')
                        <button class="text-xs px-3 py-1 border border-red-400 text-red-600 rounded hover:bg-red-50">Delete</button>
                    </form>
                </td>
            </tr>
            @empty
            <tr>
                <td colspan="7" class="px-4 py-8 text-center text-gray-400">No products yet.</td>
            </tr>
            @endforelse
        </tbody>
    </table>
    <div class="px-5 py-4 border-t">{{ $products->links() }}</div>
</div>
@endsection