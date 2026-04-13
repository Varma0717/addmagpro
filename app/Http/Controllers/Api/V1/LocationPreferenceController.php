<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\District;
use App\Models\State;
use App\Support\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class LocationPreferenceController extends Controller
{
    use ApiResponse;

    public function show(Request $request)
    {
        return $this->success($this->resolveLocationPayload($request->user()->id), 'Location fetched');
    }

    public function update(Request $request)
    {
        $data = $request->validate([
            'state_id' => ['nullable', 'integer', 'exists:states,id'],
            'district_id' => ['nullable', 'integer', 'exists:districts,id'],
        ]);

        $stateId = $data['state_id'] ?? null;
        $districtId = $data['district_id'] ?? null;

        if ($districtId && $stateId) {
            $districtBelongsToState = District::where('id', $districtId)
                ->where('state_id', $stateId)
                ->exists();

            if (! $districtBelongsToState) {
                return $this->error('Selected district does not belong to the selected state.', 422, [
                    'district_id' => ['Selected district does not belong to the selected state.'],
                ]);
            }
        }

        $state = $stateId ? State::find($stateId) : null;
        $district = $districtId ? District::find($districtId) : null;

        $payload = [
            'state_id' => $state?->id,
            'state_name' => $state?->state_name,
            'district_id' => $district?->id,
            'district_name' => $district?->district_name,
            'label' => $district?->district_name ?? $state?->state_name ?? 'All India',
            'updated_at' => now()->toISOString(),
        ];

        Cache::forever($this->cacheKey($request->user()->id), $payload);

        return $this->success($payload, 'Location updated');
    }

    private function resolveLocationPayload(int $userId): array
    {
        $cached = Cache::get($this->cacheKey($userId));

        if (is_array($cached)) {
            return [
                'state_id' => $cached['state_id'] ?? null,
                'state_name' => $cached['state_name'] ?? null,
                'district_id' => $cached['district_id'] ?? null,
                'district_name' => $cached['district_name'] ?? null,
                'label' => $cached['label'] ?? 'All India',
                'updated_at' => $cached['updated_at'] ?? null,
            ];
        }

        return [
            'state_id' => null,
            'state_name' => null,
            'district_id' => null,
            'district_name' => null,
            'label' => 'All India',
            'updated_at' => null,
        ];
    }

    private function cacheKey(int $userId): string
    {
        return "mobile_location_preference_{$userId}";
    }
}
