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

## Push notification setup (FCM + local bridge)

The app uses:

- `firebase_core` for app bootstrap
- `firebase_messaging` for FCM token + remote payload handling
- `flutter_local_notifications` as the local-notification bridge for foreground display and tap callbacks

### Firebase config files

1. Android:
   - Copy `android/app/google-services.json.example` to `android/app/google-services.json`.
   - Replace values with your Firebase project values.
2. iOS:
   - Copy `ios/Runner/GoogleService-Info.plist.example` to `ios/Runner/GoogleService-Info.plist`.
   - Replace values with your Firebase project values.

### iOS capabilities / permissions

- Push Notifications capability is required.
- Background Modes must include **Remote notifications**.
- `Runner.entitlements` includes `aps-environment` and is wired via `CODE_SIGN_ENTITLEMENTS`.
- `Info.plist` already declares notification usage and remote notification background mode.

### Token registration flow

- On app boot, permission is requested and the FCM token is obtained.
- FCM token changes are observed via `onTokenRefresh`.
- Token registration is posted to `/account/device-tokens` once an authenticated session exists and whenever session token changes.
- Incoming push events trigger a notifications sync bus so `NotificationsScreen` can refresh from server state.

## Next implementation steps

1. Add referral API endpoints in Laravel (`/api/v1/account/referrals*`).
2. Add wallet, withdraw, notifications, and profile APIs.
3. Build referral, wallet, and withdraw screens in Flutter.
4. Add secondary commerce modules (catalog/cart/checkout/orders).
