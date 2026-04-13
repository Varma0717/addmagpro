<div class="fixed bottom-5 right-5 z-[70]" x-data="chatbotWidget()">
    <button
        x-show="!open"
        @click="toggleWidget(true)"
        class="h-14 w-14 rounded-full bg-brand-500 text-white shadow-xl hover:bg-brand-600 transition flex items-center justify-center"
        aria-label="Open help assistant"
    >
        <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M8.625 9a3.375 3.375 0 116.75 0c0 1.313-.726 2.456-1.8 3.028-.724.387-1.2 1.161-1.2 1.982v.365m0 3.375h.008v.008h-.008v-.008z" />
            <path stroke-linecap="round" stroke-linejoin="round" d="M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
        </svg>
    </button>

    <div
        x-show="open"
        x-cloak
        x-transition
        class="w-[330px] max-w-[calc(100vw-2rem)] bg-white border border-surface-200 rounded-2xl shadow-2xl overflow-hidden"
    >
        <div class="px-4 py-3 bg-brand-500 text-white flex items-center justify-between">
            <div>
                <p class="font-semibold text-sm">Need help finding options?</p>
                <p class="text-xs text-brand-100">Quick intent-based suggestions</p>
            </div>
            <button @click="toggleWidget(false)" class="text-white/90 hover:text-white" aria-label="Close">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </button>
        </div>

        <div class="p-4 space-y-3">
            <div class="flex flex-wrap gap-2">
                <button @click="selectIntent('find_nearby_services')" class="px-3 py-1.5 rounded-full text-xs font-medium bg-surface-100 text-surface-700 hover:bg-surface-200">
                    Find nearby services
                </button>
                <button @click="selectIntent('best_deals_today')" class="px-3 py-1.5 rounded-full text-xs font-medium bg-surface-100 text-surface-700 hover:bg-surface-200">
                    Best deals today
                </button>
            </div>

            <template x-if="loading">
                <p class="text-xs text-surface-500">Finding suggestions…</p>
            </template>

            <template x-if="!loading && suggestions.length === 0">
                <p class="text-xs text-surface-500">Pick an intent to get suggestions.</p>
            </template>

            <div class="space-y-2 max-h-72 overflow-y-auto" x-show="suggestions.length > 0">
                <template x-for="(item, idx) in suggestions" :key="idx">
                    <a :href="item.url" @click="track('suggestion_clicked', { title: item.title, url: item.url })" class="block p-3 rounded-xl border border-surface-200 hover:border-brand-300 hover:bg-brand-50/40 transition">
                        <p class="text-sm font-semibold text-surface-800" x-text="item.title"></p>
                        <p class="text-xs text-surface-500 mt-0.5" x-text="item.subtitle"></p>
                        <p class="text-xs text-brand-600 font-medium mt-1" x-text="item.cta"></p>
                    </a>
                </template>
            </div>
        </div>
    </div>
</div>
