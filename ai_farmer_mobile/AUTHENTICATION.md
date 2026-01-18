# Authentication System

## Overview

The AI Farmer app now has a complete authentication system with multiple login options:

1. **Simple Login** - Quick access with just name (no Firebase required)
2. **Google Sign-In** - Full OAuth authentication via Firebase
3. **Session Management** - Persistent login across app restarts

## Features Implemented

### ✅ Login Screen (`lib/src/auth/login.dart`)

**Simple Login:**
- Name field (required)
- Email field (optional)
- "Get Started" button
- No Firebase/internet required
- Perfect for offline testing

**Google Sign-In:**
- One-tap Google authentication
- Automatic profile data sync
- Secure Firebase integration
- Handles user cancellation gracefully

**UI Features:**
- Loading states during authentication
- Error messages with user-friendly text
- Responsive design
- Material Design 3 styling

### ✅ Auth Service (`lib/src/services/auth_service.dart`)

**Methods:**
```dart
// Google Sign-In
Future<UserCredential?> signInWithGoogle()

// Email/Password (future use)
Future<UserCredential?> signInWithEmail(String email, String password)

// Simple login without Firebase
Future<void> simpleLogin(String name, String email)

// Sign out (handles all methods)
Future<void> signOut()

// Check login status
Future<bool> isLoggedIn()

// Get user data
Future<Map<String, String?>> getUserData()
```

**Data Stored:**
- userName
- userEmail
- userId (for Firebase users)
- loginDate
- loginMethod (simple/google/email)

### ✅ Profile Menu (`lib/src/screens/main_home_screen.dart`)

**Features:**
- User avatar with initial letter
- Display name and email
- Bottom sheet modal design
- Menu options:
  - Edit Profile
  - Settings
  - Help & Support
  - Logout (with confirmation)

**Access:**
- Tap profile icon in app bar
- Shows user information
- Quick logout access

### ✅ Session Management

**Auto-Login:**
- Checks for existing session on app start
- Automatically navigates to Home if logged in
- No need to login again

**Logout:**
- Confirmation dialog
- Clears all user data
- Signs out from Google if applicable
- Signs out from Firebase
- Returns to Login screen

## User Flows

### First Time User

```
1. Open App
   ↓
2. See Login Screen
   ↓
3. Choose login method:
   
   Option A: Simple Login
   - Enter name
   - (Optional) Enter email
   - Tap "Get Started"
   
   Option B: Google Sign-In
   - Tap "Sign in with Google"
   - Select Google account
   - Grant permissions
   ↓
4. Navigate to Home Screen
   ↓
5. Start using app
```

### Returning User

```
1. Open App
   ↓
2. Auto-login (if session exists)
   ↓
3. Navigate directly to Home Screen
```

### Logout Flow

```
1. Tap profile icon (top right)
   ↓
2. Profile menu appears
   ↓
3. Tap "Logout"
   ↓
4. Confirmation dialog
   ↓
5. Confirm logout
   ↓
6. Session cleared
   ↓
7. Return to Login Screen
```

## Testing Guide

### Test Simple Login

```bash
# Run the app
flutter run

# Steps:
1. Enter name: "Test Farmer"
2. Enter email: "test@example.com" (optional)
3. Tap "Get Started"
4. ✓ Should navigate to Home Screen
5. ✓ Profile should show "Test Farmer"
```

### Test Google Sign-In

```bash
# Prerequisites:
- Firebase project configured
- google-services.json in android/app/
- SHA-1 fingerprint added to Firebase

# Steps:
1. Tap "Sign in with Google"
2. Select Google account
3. ✓ Should navigate to Home Screen
4. ✓ Profile should show Google name/email
```

### Test Auto-Login

```bash
# Steps:
1. Login with any method
2. Close app completely
3. Reopen app
4. ✓ Should auto-login to Home Screen
```

### Test Logout

```bash
# Steps:
1. Login to app
2. Tap profile icon (top right)
3. Tap "Logout"
4. Confirm in dialog
5. ✓ Should return to Login Screen
6. ✓ Reopen app should show Login Screen
```

## Error Handling

### Google Sign-In Errors

**User Cancellation:**
- No error shown
- Stays on Login Screen
- Can try again

**Network Error:**
- Shows: "Google Sign-In failed: Network error"
- User can retry

**Firebase Not Configured:**
- Shows: "Google Sign-In failed: Firebase not initialized"
- Falls back to simple login

### Simple Login Errors

**Empty Name:**
- Shows: "Please enter your name"
- Prevents submission

**General Error:**
- Shows: "Login failed: [error details]"
- User can retry

## Security Features

✅ **Implemented:**
- Secure token storage via SharedPreferences
- Firebase Authentication integration
- Google OAuth 2.0
- Session validation
- Logout confirmation dialog

🔒 **Best Practices:**
- Never store passwords in SharedPreferences
- Use Firebase for production authentication
- Implement token refresh (Firebase handles this)
- Clear sensitive data on logout

## Configuration Files

### Required Files

**Android:**
```
android/app/google-services.json
```

**iOS:**
```
ios/Runner/GoogleService-Info.plist
```

**Flutter:**
```
lib/firebase_options.dart
```

### Generate Firebase Config

```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure Firebase
flutterfire configure
```

## Dependencies

```yaml
dependencies:
  firebase_core: ^3.1.0
  firebase_auth: ^5.1.0
  google_sign_in: ^6.2.1
  shared_preferences: ^2.2.2
```

## Code Structure

```
lib/
├── src/
│   ├── auth/
│   │   └── login.dart              # Login screen UI
│   ├── services/
│   │   └── auth_service.dart       # Authentication logic
│   └── screens/
│       ├── home_screen.dart        # Main navigation
│       └── main_home_screen.dart   # Home tab with profile
└── main.dart                       # Firebase initialization
```

## API Reference

### AuthService

```dart
final authService = AuthService();

// Sign in with Google
final userCredential = await authService.signInWithGoogle();

// Simple login
await authService.simpleLogin('John Doe', 'john@example.com');

// Check if logged in
final isLoggedIn = await authService.isLoggedIn();

// Get user data
final userData = await authService.getUserData();
print(userData['userName']); // "John Doe"

// Sign out
await authService.signOut();
```

## Troubleshooting

### Issue: Google Sign-In button does nothing

**Solution:**
1. Check Firebase configuration
2. Verify SHA-1 fingerprint
3. Enable Google Sign-In in Firebase Console
4. Check logs: `flutter logs`

### Issue: "Firebase not initialized"

**Solution:**
1. Ensure `Firebase.initializeApp()` in main.dart
2. Check firebase_options.dart exists
3. Run: `flutterfire configure`

### Issue: Auto-login not working

**Solution:**
1. Check SharedPreferences data
2. Verify userName is stored
3. Clear app data and test fresh install

## Next Steps

- [ ] Add email/password authentication
- [ ] Implement password reset
- [ ] Add phone number authentication
- [ ] Enable biometric authentication
- [ ] Add profile editing
- [ ] Implement account deletion
- [ ] Add social login (Facebook, Apple)
- [ ] Multi-device session management

## Support

For issues or questions:
1. Check GOOGLE_SIGNIN_SETUP.md for detailed setup
2. Review Firebase Console for configuration
3. Check Flutter logs for error details
4. Verify all dependencies are installed
