# AI Farmer Mobile - Feature Implementation Guide

## Screens Implemented Based on Screenshots

### 1. Main Home Screen (Green Theme)
**File**: `lib/src/screens/main_home_screen.dart`

Features:
- Hero banner: "Empowering Farmers with AI"
- Four main action buttons (green):
  - 📷 Upload Leaf Photo - Diagnose diseases instantly
  - 🎤 Ask by Voice - Get answers in your local language
  - 🛒 Check Market Prices - Current rates for your produce
  - 🏛️ Govt Scheme Info - Discover relevant agricultural schemes
- Footer: "© 2023 KISAN COPILOT. All rights reserved."

### 2. Diagnose Screen (Indigo Theme)
**File**: `lib/src/screens/diagnose_screen.dart`

Features:
- Instruction text: "Upload a photo of your crop leaf or record your symptoms for a quick diagnosis"
- Image placeholder with frame alignment guide
- Two action buttons:
  - 📷 Upload Leaf Photo (Indigo)
  - 🎥 Record Video Diagnosis (Pink)
- Recent Uploads section showing:
  - Crop thumbnail
  - Crop name (Wheat, Rice, Potato)
  - Upload date
  - Status (Diagnosed/Pending)
  - Disease name if diagnosed
  - "View Details" link

### 3. Disease Detail Screen
**File**: `lib/src/screens/disease_detail_screen.dart`

Features:
- Large disease image with overlay
- Disease name: "Early Blight"
- Scientific name: "(Alternaria Solani)"
- Confidence score: "92%"
- Expandable sections:
  - ❓ Why this disease? - Detailed explanation
  - 💊 Treatment Actions - Step-by-step remedies
  - 🛡️ Prevention Tips - Proactive measures
  - 🛍️ Recommended Products - Fungicides and treatments

### 4. Market Intelligence Screen
**File**: `lib/src/screens/market_screen.dart`

Features:
- Search bar: "Search crop, e.g., 'Wheat'"
- Nearby Mandis section:
  - Mandi name and location
  - Distance from user
  - Current price per quintal
  - "View Details" button
- Crop Price Trends:
  - Interactive line chart (6 months)
  - Three crops comparison: Wheat, Rice, Maize
  - Color-coded legend
- Selling Suggestions:
  - 💡 Optimal Sell Time: Early Monsoon
  - 📍 Best Location: Pimpri Mandi
  - Actionable insights with descriptions

### 5. Market Detail Screen
**File**: `lib/src/screens/market_detail_screen.dart`

Features:
- Crop-specific price information
- Today's price vs Yesterday
- Trend indicator (↑ Slight Increase)
- Suggestion badge: "Hold or sell"
- Government Scheme Suggestions:
  - PM-KISAN details
  - Soil Health Card Scheme
  - "View Official Source" links

### 6. Government Schemes Screen
**File**: `lib/src/screens/schemes_screen.dart`

Features:
- Eligibility Checker:
  - State dropdown
  - Crop type dropdown
  - Land ownership radio buttons (Owned/Leased)
  - Farm size slider (1-50 acres)
  - "Check Eligibility" button
- Available Schemes list:
  - Scheme icon and name
  - Status badge (Eligible/Recommended/Not Applicable)
  - Description
  - "View Details" button
- Schemes included:
  - Pradhan Mantri Fasal Bima Yojana
  - Kisan Credit Card (KCC) Scheme
  - Soil Health Card Scheme
  - National Food Security Mission
  - PM Kisan Samman Nidhi

## Navigation Structure

Bottom Navigation Bar (4 tabs):
1. 🏠 Home - Main dashboard
2. 📷 Diagnose - Disease detection
3. 📊 Market - Price intelligence
4. 🏛️ Schemes - Government programs

## Color Coding

- **Green**: Primary actions, positive trends, eligible status
- **Indigo**: Diagnose features, professional look
- **Pink**: Video/multimedia features
- **Orange**: Warnings, recommended status
- **Red**: Negative trends, critical alerts
- **Grey**: Inactive, not applicable

## User Flow Examples

### Disease Detection Flow:
1. User taps "Upload Leaf Photo" on home
2. Opens Diagnose Screen
3. Takes photo or selects from gallery
4. AI analyzes image (loading state)
5. Shows Disease Detail Screen with results
6. User reads treatment recommendations

### Market Intelligence Flow:
1. User taps "Check Market Prices"
2. Opens Market Screen
3. Views nearby mandis and prices
4. Checks price trend chart
5. Reads selling suggestions
6. Taps specific crop for detailed view

### Scheme Discovery Flow:
1. User taps "Govt Scheme Info"
2. Opens Schemes Screen
3. Fills eligibility form
4. Taps "Check Eligibility"
5. Views filtered schemes with status
6. Taps "View Details" for more info

## Technical Implementation

- **State Management**: StatefulWidget with setState
- **Navigation**: MaterialPageRoute for screen transitions
- **Data Persistence**: SharedPreferences for user data
- **Image Handling**: image_picker package
- **Charts**: fl_chart package for price trends
- **UI**: Material Design 3 components
- **Responsive**: SingleChildScrollView for all screens
