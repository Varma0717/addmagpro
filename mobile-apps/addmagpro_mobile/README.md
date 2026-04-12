# AddMagPro Mobile

Flutter app for Android and iOS.

## Implemented in this phase

- App scaffold created under `mobile-apps/addmagpro_mobile`
- Production API integration base: `https://addmagpro.pmratnam.com/api/v1`
- Authentication flow:
 	- Login: `POST /auth/login`
 	- Register: `POST /auth/register`
 	- Session restore: `GET /me`
 	- Logout: `POST /auth/logout`
- Secure token persistence using `flutter_secure_storage`
- Referral-first post-login placeholder home screen

## Folder highlights

- `lib/core` - config, network client, secure storage
- `lib/features/auth` - auth repository, login/register screens
- `lib/features/home` - first authenticated dashboard shell

## Run locally

1. Ensure Flutter SDK is installed.
2. From this folder run:

```bash
flutter pub get
flutter run
```

## Windows note

If package resolution fails with plugin symlink errors, enable Developer Mode on Windows:

```powershell
start ms-settings:developers
```

Then retry `flutter pub get`.

## Next implementation steps

1. Add referral API endpoints in Laravel (`/api/v1/account/referrals*`).
2. Add wallet, withdraw, notifications, and profile APIs.
3. Build referral, wallet, and withdraw screens in Flutter.
4. Add secondary commerce modules (catalog/cart/checkout/orders).
