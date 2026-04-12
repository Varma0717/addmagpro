<?php

namespace App\Http\Controllers\Account;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;

class ProfileController extends Controller
{
    public function edit()
    {
        return view('account.profile');
    }

    public function update(Request $request)
    {
        $user = $request->user();

        $data = $request->validate([
            'name'   => 'required|string|max:255',
            'phone'  => 'nullable|string|max:20',
            'email'  => ['nullable', 'string', 'email', 'max:255', Rule::unique(User::class)->ignore($user->id)],
            'avatar' => 'nullable|image|max:2048',
        ]);

        $data['email'] = $request->filled('email') ? strtolower($request->email) : null;

        if ($user->email !== $data['email']) {
            $data['email_verified_at'] = null;
        }

        if ($request->hasFile('avatar')) {
            if ($user->avatar) Storage::disk('public')->delete($user->avatar);
            $data['avatar'] = $request->file('avatar')->store('avatars', 'public');
        }

        $user->update($data);

        return back()->with('success', 'Profile updated.');
    }
}
