# AddMagPro Mobile Build & CI Guide

This document defines local build commands, signing prerequisites, CI secrets, and artifact output paths for QA downloads.

## Local build commands

Run all commands from `mobile-apps/addmagpro_mobile`.

### Debug build

```bash
flutter pub get
flutter build apk --debug
```

### Release Android builds

```bash
flutter pub get
flutter build apk --release
flutter build appbundle --release
```

### Release iOS build

```bash
flutter pub get
flutter build ipa --release
```

## Signing prerequisites

### Android signing prerequisites

1. Create a release keystore (`.jks` or `.keystore`).
2. Add `android/key.properties` with values for:
   - `storeFile`
   - `storePassword`
   - `keyAlias`
   - `keyPassword`
3. Ensure `android/app/build.gradle.kts` reads the release signing config from `key.properties`.

### iOS signing prerequisites

1. Apple Developer account with distribution certificate.
2. App identifier and provisioning profile for `Runner` bundle id.
3. Install/import:
   - Distribution certificate (`.p12`) + password
   - Provisioning profile (`.mobileprovision`)
4. Configure export options (team id, method, signing style) so `flutter build ipa --release` can export an `.ipa`.

## CI workflows

Workflow file: `.github/workflows/mobile-build.yml`.

- Android artifacts are built on **push**, **tag**, and **manual dispatch**.
- iOS artifacts are built on **macOS runners** on push/tag/manual dispatch.
- If iOS signing secrets are present, CI creates a signed `.ipa`.
- If iOS signing secrets are missing, CI falls back to `--no-codesign` and publishes the generated archive for QA/dev validation.

## Required GitHub Actions secrets

### Android

- `ANDROID_KEYSTORE_BASE64` (required for signed release artifacts)
  - Base64 content of release keystore file.
- `ANDROID_KEY_PROPERTIES` (required for signed release artifacts)
  - Full `key.properties` file content, for example:
    ```properties
    storePassword=***
    keyPassword=***
    keyAlias=upload
    storeFile=upload-keystore.jks
    ```

### iOS signing and App Store Connect

- `IOS_CERTIFICATE_P12_BASE64` (required for signed IPA)
- `IOS_CERTIFICATE_PASSWORD` (required for signed IPA)
- `IOS_PROVISIONING_PROFILE_BASE64` (required for signed IPA)
- `IOS_TEAM_ID` (required for signed IPA export options)
- `APP_STORE_CONNECT_ISSUER_ID` (required if you later add upload/release steps)
- `APP_STORE_CONNECT_KEY_ID` (required if you later add upload/release steps)
- `APP_STORE_CONNECT_PRIVATE_KEY` (required if you later add upload/release steps)

## CI artifact output paths

### Android

- Debug APK: `build/app/outputs/flutter-apk/app-debug.apk`
- Release APK: `build/app/outputs/flutter-apk/app-release.apk`
- Release App Bundle: `build/app/outputs/bundle/release/app-release.aab`

### iOS

- Signed IPA (when signing secrets are configured): `build/ios/ipa/*.ipa`
- Xcode archive: `build/ios/archive/Runner.xcarchive`
- Unsigned/export-disabled fallback archive zip published by CI: `build/ios/archive/Runner.xcarchive.zip`

## QA download process

1. Open the workflow run in GitHub Actions.
2. Download artifacts:
   - `android-artifacts-<run_number>`
   - `ios-artifacts-<run_number>`
3. Share the downloaded APK/AAB/IPA (or archive) with QA.
