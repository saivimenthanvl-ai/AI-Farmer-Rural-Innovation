# Quick Start Guide - AI Farmer Mobile

## ✅ What's Working Now

### 1. Simple Login (No Setup Required)
- Open the app
- Enter your name
- Tap "Get Started"
- Start using the app immediately!

### 2. Google Sign-In (Requires Firebase Setup)
- Tap "Sign in with Google"
- Select your Google account
- Automatic profile sync

### 3. User Profile & Logout
- Tap profile icon (top right)
- View your profile information
- Logout with confirmation

## 🚀 Run the App (Simple Login)

```bash
cd ai_farmer_mobile
flutter run
```

That's it! The simple login works without any additional setup.

## 🔧 Enable Google Sign-In (Optional)

### Prerequisites
- Firebase account
- 15 minutes setup time

### Quick Setup Steps

1. **Create Firebase Project**
   - Go to https://console.firebase.google.com/
   - Create new project: "AI Farmer"
   - Enable Google Analytics (optional)

2. **Add Android App**
   - Click "Add app" → Android
   - Package name: `com.example.ai_farmer_mobile`
   - Download `google-services.json`
   - Place in `android/app/`

3. **Get SHA-1 Fingerprint**
   ```bash
   cd android
   ./gradlew signingReport
   ```
   Copy SHA-1 and add to Firebase project settings

4. **Enable Google Sign-In**
   - Firebase Console → Authentication
   - Sign-in method → Google → Enable

5. **Configure FlutterFire**
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```

6. **Run the App**
   ```bash
   flutter run
   ```

Now Google Sign-In will work!

## 📱 App Features

### Home Screen
- 4 main action buttons
- Quick access to all features
- User profile in app bar

### Diagnose
- Upload leaf photos
- Disease detection
- Treatment recommendations
- Recent uploads history

### Market Intelligence
- Nearby mandis with prices
- Price trend charts
- Selling suggestions
- Crop price comparison

### Government Schemes
- Eligibility checker
- Available schemes list
- Detailed scheme information
- Status badges (Eligible/Recommended)

## 🧪 Testing

### Test Simple Login
1. Run app: `flutter run`
2. Enter name: "Test Farmer"
3. Tap "Get Started"
4. ✓ Should see Home Screen

### Test Logout
1. Tap profile icon (top right)
2. Tap "Logout"
3. Confirm
4. ✓ Should return to Login Screen

### Test Auto-Login
1. Login once
2. Close app
3. Reopen app
4. ✓ Should auto-login

## 📚 Documentation

- **AUTHENTICATION.md** - Complete auth system guide
- **GOOGLE_SIGNIN_SETUP.md** - Detailed Firebase setup
- **APP_STRUCTURE.md** - App architecture
- **FEATURES.md** - Feature implementation details

## 🐛 Troubleshooting

### App won't run
```bash
flutter clean
flutter pub get
flutter run
```

### Google Sign-In not working
- Check `google-services.json` is in `android/app/`
- Verify SHA-1 fingerprint in Firebase
- Enable Google Sign-In in Firebase Console

### Build errors
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

## 📦 Dependencies Installed

✅ firebase_core: ^3.1.0
✅ firebase_auth: ^5.1.0
✅ google_sign_in: ^6.2.1
✅ shared_preferences: ^2.2.2
✅ image_picker: ^1.0.8
✅ fl_chart: ^0.68.0
✅ camera: ^0.10.5+9

## 🎯 Next Steps

1. **Try Simple Login** - Works immediately
2. **Setup Firebase** - For Google Sign-In (optional)
3. **Test All Features** - Explore the app
4. **Customize** - Add your own features

## 💡 Tips

- Simple login is perfect for development and testing
- Google Sign-In provides better security for production
- All user data is stored locally with SharedPreferences
- Logout clears all data for privacy

## 🆘 Need Help?

1. Check the documentation files
2. Review Firebase Console for configuration
3. Check Flutter logs: `flutter logs`
4. Verify all dependencies: `flutter pub get`

## ✨ What's New

### Authentication System
- ✅ Simple login (name-based)
- ✅ Google Sign-In integration
- ✅ Auto-login on app restart
- ✅ Profile menu with user info
- ✅ Logout with confirmation
- ✅ Session management

### UI Improvements
- ✅ Profile icon in app bar
- ✅ User avatar with initial
- ✅ Bottom sheet profile menu
- ✅ Loading states
- ✅ Error handling

## 🚀 Ready to Go!

The app is fully functional with simple login. Google Sign-In is optional but recommended for production use.

```bash
# Start developing now!
flutter run
```

Enjoy building with AI Farmer! 🌾
