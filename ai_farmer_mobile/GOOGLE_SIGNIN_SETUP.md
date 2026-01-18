# Google Sign-In Setup Guide

## Overview
The app now supports Google Sign-In authentication using Firebase Authentication and Google Sign-In package.

## Implementation Status

✅ **Completed:**
- Google Sign-In package integrated (`google_sign_in: ^6.2.1`)
- Firebase Authentication setup
- AuthService class for handling authentication
- Login screen with Google Sign-In button
- Logout functionality with Google Sign-Out
- User data persistence with SharedPreferences

## Setup Instructions

### 1. Firebase Project Setup

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or select existing one
3. Add your Android/iOS app to the project
4. Download configuration files:
   - **Android**: `google-services.json` → Place in `android/app/`
   - **iOS**: `GoogleService-Info.plist` → Place in `ios/Runner/`

### 2. Enable Google Sign-In in Firebase

1. In Firebase Console, go to **Authentication** → **Sign-in method**
2. Enable **Google** as a sign-in provider
3. Add your app's SHA-1 fingerprint (for Android)

### 3. Get SHA-1 Fingerprint (Android)

```bash
cd android
./gradlew signingReport
```

Copy the SHA-1 fingerprint and add it to Firebase project settings.

### 4. Android Configuration

Update `android/app/build.gradle`:

```gradle
dependencies {
    implementation platform('com.google.firebase:firebase-bom:32.7.0')
    implementation 'com.google.firebase:firebase-auth'
    implementation 'com.google.android.gms:play-services-auth:20.7.0'
}
```

Add to `android/build.gradle`:

```gradle
buildscript {
    dependencies {
        classpath 'com.google.gms:google-services:4.4.0'
    }
}
```

Add to `android/app/build.gradle` (at the bottom):

```gradle
apply plugin: 'com.google.gms.google-services'
```

### 5. iOS Configuration

Update `ios/Podfile`:

```ruby
platform :ios, '12.0'

target 'Runner' do
  use_frameworks!
  use_modular_headers!

  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
end
```

Run:
```bash
cd ios
pod install
```

### 6. Install Dependencies

```bash
flutter pub get
```

### 7. Firebase Options File

The app already has `firebase_options.dart`. If you need to regenerate it:

```bash
flutterfire configure
```

## How It Works

### AuthService (`lib/src/services/auth_service.dart`)

The `AuthService` class handles all authentication operations:

- **signInWithGoogle()**: Initiates Google Sign-In flow
- **signInWithEmail()**: Email/password authentication (for future use)
- **simpleLogin()**: Quick login without Firebase (fallback)
- **signOut()**: Signs out from Google and Firebase
- **isLoggedIn()**: Checks if user is logged in
- **getUserData()**: Retrieves stored user information

### Login Flow

1. User taps "Sign in with Google"
2. Google Sign-In dialog appears
3. User selects Google account
4. App receives authentication token
5. Firebase authenticates with Google credential
6. User data saved to SharedPreferences
7. Navigate to Home Screen

### Logout Flow

1. User taps profile icon → Logout
2. Confirmation dialog appears
3. If confirmed:
   - Sign out from Google (if logged in with Google)
   - Sign out from Firebase
   - Clear SharedPreferences
   - Navigate to Login Screen

## Features

### Login Screen
- Simple name/email login (no Firebase required)
- Google Sign-In button
- Loading states during authentication
- Error handling with user-friendly messages

### Profile Menu
- User avatar with initial
- Display name and email
- Edit Profile option
- Settings option
- Help & Support option
- Logout button

### Session Management
- Persistent login using SharedPreferences
- Auto-login on app restart
- Tracks login method (simple/google/email)
- Stores user ID, name, email, and login date

## Testing

### Test Simple Login
1. Enter name (email optional)
2. Tap "Get Started"
3. Should navigate to Home Screen

### Test Google Sign-In
1. Tap "Sign in with Google"
2. Select Google account
3. Should navigate to Home Screen
4. Profile should show Google account info

### Test Logout
1. Tap profile icon in Home Screen
2. Tap "Logout"
3. Confirm logout
4. Should return to Login Screen

## Troubleshooting

### Google Sign-In Not Working

**Issue**: "Google Sign-In failed" error

**Solutions**:
1. Verify Firebase configuration files are in correct locations
2. Check SHA-1 fingerprint is added to Firebase
3. Ensure Google Sign-In is enabled in Firebase Console
4. Verify `google-services.json` is up to date
5. Clean and rebuild: `flutter clean && flutter pub get`

### Firebase Not Initialized

**Issue**: "Firebase not initialized" error

**Solution**:
- Ensure `Firebase.initializeApp()` is called in `main.dart`
- Check `firebase_options.dart` exists
- Run `flutterfire configure` to regenerate config

### SHA-1 Fingerprint Issues

**Debug SHA-1**:
```bash
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

**Release SHA-1**:
```bash
keytool -list -v -keystore /path/to/your/keystore -alias your-alias
```

## Security Notes

- Never commit `google-services.json` or `GoogleService-Info.plist` to public repositories
- Use environment variables for sensitive configuration
- Implement proper token refresh mechanisms
- Add rate limiting for authentication attempts
- Enable Firebase App Check for production

## Future Enhancements

- [ ] Email/password authentication
- [ ] Phone number authentication
- [ ] Apple Sign-In (iOS)
- [ ] Facebook Login
- [ ] Two-factor authentication
- [ ] Biometric authentication
- [ ] Password reset functionality
- [ ] Account deletion option

## Resources

- [Firebase Authentication Docs](https://firebase.google.com/docs/auth)
- [Google Sign-In Flutter Package](https://pub.dev/packages/google_sign_in)
- [FlutterFire Documentation](https://firebase.flutter.dev/)
