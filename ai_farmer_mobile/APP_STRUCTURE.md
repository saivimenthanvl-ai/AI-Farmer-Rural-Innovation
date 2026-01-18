# AI Farmer Mobile App

A comprehensive Flutter mobile application for farmers with AI-powered crop disease detection, market intelligence, and government scheme information.

## Features Implemented

### 1. Authentication
- **Login Screen** (`lib/src/auth/login.dart`)
  - Simple name-based authentication
  - Persistent login using SharedPreferences
  - Clean, modern UI with gradient background

### 2. Main Navigation
- **Home Screen** (`lib/src/screens/home_screen.dart`)
  - Bottom navigation with 4 tabs
  - Seamless navigation between features

### 3. Home Tab
- **Main Home Screen** (`lib/src/screens/main_home_screen.dart`)
  - Hero banner with "Empowering Farmers with AI"
  - Quick action buttons:
    - Upload Leaf Photo
    - Ask by Voice
    - Check Market Prices
    - Govt Scheme Info

### 4. Diagnose Tab
- **Diagnose Screen** (`lib/src/screens/diagnose_screen.dart`)
  - Upload leaf photo for disease detection
  - Record video diagnosis option
  - Recent uploads list with status
  - Image picker integration (camera/gallery)
  
- **Disease Detail Screen** (`lib/src/screens/disease_detail_screen.dart`)
  - Disease name and scientific name
  - Confidence percentage
  - Expandable sections:
    - Why this disease?
    - Treatment actions
    - Prevention tips
    - Recommended products

### 5. Market Tab
- **Market Screen** (`lib/src/screens/market_screen.dart`)
  - Search crops functionality
  - Nearby mandis with prices and distances
  - Interactive price trend charts (6 months)
  - Comparison of Wheat, Rice, and Maize prices
  - Selling suggestions with actionable insights
  
- **Market Detail Screen** (`lib/src/screens/market_detail_screen.dart`)
  - Detailed price information for specific crops
  - Today's price vs yesterday
  - Price trend indicators
  - Buy/hold/sell suggestions
  - Related government schemes

### 6. Schemes Tab
- **Schemes Screen** (`lib/src/screens/schemes_screen.dart`)
  - Eligibility checker with filters:
    - State selection
    - Crop type
    - Land ownership (Owned/Leased)
    - Farm size slider
  - Available schemes list with status badges:
    - Eligible (green)
    - Recommended (orange)
    - Not Applicable (grey)
  - Detailed scheme descriptions
  - View details buttons

## Key Technologies

- **Flutter**: Cross-platform mobile framework
- **SharedPreferences**: Local data persistence
- **Image Picker**: Camera and gallery access
- **FL Chart**: Interactive charts for market data
- **Material Design 3**: Modern UI components

## Screen Flow

```
Login Screen
    ↓
Home Screen (Bottom Navigation)
    ├── Home Tab (Main Home Screen)
    ├── Diagnose Tab
    │   └── Disease Detail Screen
    ├── Market Tab
    │   └── Market Detail Screen
    └── Schemes Tab
```

## Color Scheme

- **Primary**: Green (Agriculture theme)
- **Secondary**: Indigo (Professional look)
- **Accent**: Pink (Video/Voice features)
- **Status Colors**:
  - Green: Eligible, Positive trends
  - Orange: Recommended, Warnings
  - Red: Negative trends
  - Grey: Not applicable

## Future Enhancements

1. **AI Integration**
   - TensorFlow Lite model for disease detection
   - Voice recognition for queries
   - Multilingual support

2. **Real-time Data**
   - Live market prices API
   - Weather integration
   - Government scheme updates

3. **Offline Support**
   - Local database with Drift
   - Cached disease information
   - Offline diagnosis history

4. **Social Features**
   - Farmer community
   - Expert consultations
   - Success stories

## Running the App

```bash
cd ai_farmer_mobile
flutter pub get
flutter run
```

## Dependencies

See `pubspec.yaml` for complete list of dependencies including:
- firebase_core, firebase_auth
- camera, image_picker
- fl_chart
- shared_preferences
- geolocator
- speech_to_text
