<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\V1\LoginRequest;
use App\Http\Requests\Api\V1\RegisterRequest;
use App\Models\User;
use App\Services\ReferralService;
use App\Support\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    use ApiResponse;

    public function __construct(private readonly ReferralService $referralService) {}

    public function register(RegisterRequest $request)
    {
        $validated = $request->validated();

        $referrerId = null;
        if (!empty($validated['referral_code'])) {
            $referrerId = User::where('referral_code', strtoupper($validated['referral_code']))->value('id');
        }

        $user = User::create([
            'name' => $validated['name'],
            'email' => strtolower($validated['email']),
            'phone' => $validated['phone'] ?? null,
            'password' => Hash::make($validated['password']),
            'role' => 'user',
            'is_active' => true,
            'referral_code' => strtoupper(Str::random(8)),
            'referred_by' => $referrerId,
            'email_verified_at' => now(),
        ]);

        $this->referralService->handleSignup($user);

        $token = $user->createToken($request->userAgent() ?: 'mobile-app')->plainTextToken;

        return $this->success([
            'token' => $token,
            'token_type' => 'Bearer',
            'user' => $user,
        ], 'Registration successful', 201);
    }

    public function login(LoginRequest $request)
    {
        $validated = $request->validated();
        $user = User::where('email', strtolower($validated['email']))->first();

        if (!$user || !Hash::check($validated['password'], $user->password)) {
            return $this->error('Invalid credentials', 422);
        }

        if (!$user->is_active) {
            return $this->error('Your account is inactive', 403);
        }

        $deviceName = $validated['device_name'] ?? ($request->userAgent() ?: 'mobile-app');
        $token = $user->createToken($deviceName)->plainTextToken;

        return $this->success([
            'token' => $token,
            'token_type' => 'Bearer',
            'user' => $user,
        ], 'Login successful');
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()?->delete();

        return $this->success(null, 'Logged out successfully');
    }

    public function logoutAll(Request $request)
    {
        $request->user()->tokens()->delete();

        return $this->success(null, 'Logged out from all devices');
    }
}
