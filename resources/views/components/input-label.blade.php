@props(['value'])

<label {{ $attributes->merge(['class' => 'block font-medium text-sm text-surface-700']) }}>
    {{ $value ?? $slot }}
</label>