<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\Validation\ValidationException;
use Illuminate\View\View;
use App\Services\ReferralService;
use Illuminate\Support\Str;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     */
    public function create(): View
    {
        $referralCode = request('ref');
        return view('auth.register', compact('referralCode'));
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'name'          => ['required', 'string', 'max:255'],
            'phone'         => ['required', 'string', 'max:20', 'unique:' . User::class],
            'email'         => ['nullable', 'string', 'lowercase', 'email', 'max:255', 'unique:' . User::class],
            'password'      => ['required', 'confirmed', Rules\Password::defaults()],
            'referral_code' => ['nullable', 'string', 'exists:users,referral_code'],
        ]);

        $referrer = null;
        if ($request->filled('referral_code')) {
            $referrer = User::where('referral_code', $request->referral_code)->first();
        }

        $user = User::create([
            'name'          => $request->name,
            'phone'         => $request->phone,
            'email'         => $request->filled('email') ? strtolower($request->email) : null,
            'password'      => Hash::make($request->password),
            'referral_code' => strtoupper(Str::random(8)),
            'referred_by'   => $referrer?->id,
        ]);

        event(new Registered($user));

        if ($referrer) {
            app(ReferralService::class)->handleSignup($user);
        }

        Auth::login($user);

        return redirect(route('dashboard', absolute: false));
    }
}
