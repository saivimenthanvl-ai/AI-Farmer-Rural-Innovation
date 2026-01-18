# Firebase Setup Guide for AI Farmer

## Step 1: Create a Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project" or "Create a project"
3. Enter project name: "AI Farmer" (or your preferred name)
4. Enable Google Analytics (optional)
5. Click "Create project"

## Step 2: Register Your Web App

1. In your Firebase project, click the **Web icon** (</>) to add a web app
2. Register app with nickname: "AI Farmer Web"
3. Check "Also set up Firebase Hosting" (optional)
4. Click "Register app"
5. Copy the Firebase configuration object

## Step 3: Enable Authentication

1. In Firebase Console, go to **Build** → **Authentication**
2. Click "Get started"
3. Go to **Sign-in method** tab
4. Enable **Email/Password**:
   - Click on "Email/Password"
   - Toggle "Enable"
   - Click "Save"
5. Enable **Google**:
   - Click on "Google"
   - Toggle "Enable"
   - Select a support email
   - Click "Save"

## Step 4: Set Up Firestore Database

1. In Firebase Console, go to **Build** → **Firestore Database**
2. Click "Create database"
3. Choose **Start in production mode** (we'll add rules later)
4. Select a location (choose closest to your users)
5. Click "Enable"

## Step 5: Configure Firestore Security Rules

Go to **Firestore Database** → **Rules** tab and paste:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users collection - users can only read/write their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Allow admins to read all users (optional)
    match /users/{userId} {
      allow read: if request.auth != null && 
                     get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'admin';
    }
  }
}
```

Click "Publish"

## Step 6: Update Your Code

### Replace Firebase Config in Both Files:

**File 1: `static/login.html`** (around line 130)
**File 2: `static/index.html`** (around line 180)

Replace this:
```javascript
const firebaseConfig = {
    apiKey: "YOUR_API_KEY",
    authDomain: "YOUR_AUTH_DOMAIN",
    projectId: "YOUR_PROJECT_ID",
    storageBucket: "YOUR_STORAGE_BUCKET",
    messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
    appId: "YOUR_APP_ID"
};
```

With your actual config from Firebase Console:
```javascript
const firebaseConfig = {
    apiKey: "AIzaSyXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    authDomain: "your-project.firebaseapp.com",
    projectId: "your-project-id",
    storageBucket: "your-project.appspot.com",
    messagingSenderId: "123456789012",
    appId: "1:123456789012:web:abcdef123456"
};
```

## Step 7: Test Your Setup

1. Restart your server: `python main.py`
2. Open `http://localhost:8000/login`
3. Try signing up with email/password
4. Try signing in with Google
5. Check Firestore Database to see user data being stored

## Firestore Data Structure

Your users will be stored in Firestore with this structure:

```
users (collection)
  └── {userId} (document)
      ├── uid: string
      ├── email: string
      ├── displayName: string
      ├── photoURL: string
      ├── createdAt: timestamp
      ├── lastLogin: timestamp
      ├── loginDates: array of strings (YYYY-MM-DD)
      └── totalLogins: number
```

## Viewing User Login Data

1. Go to Firebase Console → Firestore Database
2. Click on "users" collection
3. Click on any user document to see their login history
4. `loginDates` array shows all unique dates the user logged in
5. `totalLogins` shows total number of logins
6. `lastLogin` shows the most recent login timestamp

## Optional: Add Custom Domain

1. Go to **Hosting** in Firebase Console
2. Click "Add custom domain"
3. Follow the instructions to connect your domain

## Troubleshooting

### "Firebase: Error (auth/unauthorized-domain)"
- Go to Authentication → Settings → Authorized domains
- Add your domain (e.g., `localhost`, `yourdomain.com`)

### "Missing or insufficient permissions"
- Check Firestore Security Rules
- Make sure user is authenticated before accessing Firestore

### Google Sign-In not working
- Verify Google Sign-In is enabled in Authentication
- Check that you've selected a support email
- Make sure your domain is authorized

## Security Best Practices

1. **Never commit your Firebase config to public repositories** if it contains sensitive data
2. Use environment variables for production
3. Implement proper Firestore security rules
4. Enable App Check for additional security
5. Monitor usage in Firebase Console

## Next Steps

- Add user profile page
- Implement password reset functionality
- Add email verification
- Create admin dashboard to view user analytics
- Add more user fields (location, farm size, crops, etc.)
