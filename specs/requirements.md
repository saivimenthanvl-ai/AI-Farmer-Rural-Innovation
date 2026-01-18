# Requirements Document: Kisan Copilot

## Introduction

Kisan Copilot is an AI-powered agricultural assistant designed for smallholder farmers in rural India. The system provides crop disease detection, explainable diagnosis, treatment guidance, market intelligence, and government scheme recommendations through a mobile application with voice-based interaction in local languages. The application is built with Flutter and Firebase to support low-bandwidth rural deployment scenarios.

## Glossary

- **System**: The Kisan Copilot mobile application and backend services
- **Disease_Detector**: The ML-based component that analyzes crop leaf images
- **Voice_Interface**: The component that handles speech-to-text and text-to-speech in local languages
- **Market_Intelligence**: The component that provides crop price information and mandi locations
- **Scheme_Recommender**: The component that matches farmers with relevant government schemes
- **Explainer**: The component that generates human-readable explanations for AI decisions
- **User**: A farmer, FPO member, or agricultural extension officer using the application
- **Confidence_Score**: A numerical value (0-1) indicating the certainty of disease detection
- **Mandi**: A regulated agricultural market where farmers sell produce
- **FPO**: Farmer Producer Organization
- **Low_Confidence_Threshold**: A configurable value below which the system escalates to human experts

## Requirements

### Requirement 1: Crop Disease Detection

**User Story:** As a farmer, I want to upload a photo of a diseased crop leaf, so that I can quickly identify what is affecting my crops.

#### Acceptance Criteria

1. WHEN a user uploads a crop leaf image, THE Disease_Detector SHALL process the image and return a disease classification within 3 seconds
2. WHEN the Disease_Detector processes an image, THE System SHALL return a confidence score between 0 and 1 for the classification
3. WHEN the confidence score is below the Low_Confidence_Threshold, THE System SHALL display a low-confidence warning and recommend consulting an expert
4. WHEN the Disease_Detector identifies a disease, THE System SHALL return the disease name, affected crop type, and severity level
5. WHEN the image quality is insufficient for analysis, THE System SHALL provide guidance on capturing a better image
6. WHEN the uploaded image does not contain a recognizable crop leaf, THE System SHALL return an appropriate error message

### Requirement 2: Explainable Diagnosis

**User Story:** As a farmer with limited technical knowledge, I want to understand why the system identified a particular disease, so that I can trust the diagnosis and take appropriate action.

#### Acceptance Criteria

1. WHEN a disease is detected, THE Explainer SHALL generate a human-readable explanation of the diagnosis
2. WHEN displaying an explanation, THE System SHALL highlight the visual symptoms that led to the diagnosis
3. WHEN providing an explanation, THE System SHALL use simple language appropriate for non-technical users
4. WHEN a diagnosis is made, THE System SHALL display the reasoning within the 5-second end-to-end response time
5. WHERE the user prefers voice output, THE System SHALL speak the explanation in the user's selected language

### Requirement 3: Treatment Guidance

**User Story:** As a farmer, I want to receive clear treatment recommendations with dosage information, so that I can effectively treat the disease and protect my crops.

#### Acceptance Criteria

1. WHEN a disease is identified, THE System SHALL provide step-by-step treatment instructions
2. WHEN displaying treatment options, THE System SHALL include both organic and chemical treatment alternatives
3. WHEN recommending chemical treatments, THE System SHALL specify dosage amounts, application frequency, and safety precautions
4. WHEN providing treatment guidance, THE System SHALL include the expected timeline for recovery
5. WHEN safety precautions are required, THE System SHALL prominently display warnings about protective equipment and waiting periods
6. IF the disease requires immediate professional intervention, THEN THE System SHALL escalate the recommendation to consult an agricultural expert

### Requirement 4: Market Price Intelligence

**User Story:** As a farmer planning to sell my harvest, I want to see current market prices and nearby mandi locations, so that I can make informed decisions about when and where to sell.

#### Acceptance Criteria

1. WHEN a user requests market prices for a crop, THE Market_Intelligence SHALL return current price data within 2 seconds
2. WHEN displaying market prices, THE System SHALL show price trends for the past 30 days
3. WHEN providing market information, THE System SHALL identify the three nearest mandis with their distances
4. WHEN market data is unavailable or stale, THE System SHALL display the last update timestamp and a data freshness warning
5. WHEN displaying prices, THE System SHALL show the minimum, maximum, and modal prices for the selected crop

### Requirement 5: Government Scheme Recommendations

**User Story:** As a farmer, I want to discover government schemes I am eligible for, so that I can access financial support and resources for my farming activities.

#### Acceptance Criteria

1. WHEN a user views scheme recommendations, THE Scheme_Recommender SHALL return schemes matching the user's profile
2. WHEN displaying schemes, THE System SHALL show eligibility criteria, benefits, and application deadlines
3. WHEN a scheme is recommended, THE System SHALL explain why the user is eligible based on their profile
4. WHEN scheme information is displayed, THE System SHALL provide contact information for scheme administrators
5. WHEN a user's profile changes, THE System SHALL update scheme recommendations within 24 hours

### Requirement 6: Voice-Based Interaction

**User Story:** As a farmer with limited literacy, I want to interact with the application using voice commands in my local language, so that I can access all features without reading text.

#### Acceptance Criteria

1. WHEN a user activates voice input, THE Voice_Interface SHALL accept speech in the user's selected language
2. WHEN processing voice input, THE System SHALL convert speech to text within 2 seconds
3. WHEN providing responses, THE Voice_Interface SHALL convert text to speech in the user's selected language
4. WHEN voice synthesis is active, THE System SHALL allow users to pause, replay, or skip audio output
5. WHERE network connectivity is limited, THE Voice_Interface SHALL cache common phrases for offline playback
6. WHEN voice recognition fails, THE System SHALL provide visual feedback and allow the user to retry or switch to text input

### Requirement 7: Low-Bandwidth Rural Deployment

**User Story:** As a farmer in a rural area with poor internet connectivity, I want the application to work efficiently on slow networks, so that I can access agricultural assistance despite connectivity challenges.

#### Acceptance Criteria

1. WHEN network bandwidth is below 100 kbps, THE System SHALL compress images before upload
2. WHEN uploading images, THE System SHALL display upload progress and allow cancellation
3. WHEN network connectivity is lost, THE System SHALL queue requests and retry when connectivity is restored
4. WHEN displaying content, THE System SHALL prioritize text and critical information over decorative images
5. WHERE offline functionality is available, THE System SHALL cache previously viewed disease information and treatment guides
6. WHEN the application starts, THE System SHALL load essential features within 3 seconds on 2G networks

### Requirement 8: User Profile and Preferences

**User Story:** As a farmer, I want to maintain a profile with my farm details and language preferences, so that the system can provide personalized recommendations.

#### Acceptance Criteria

1. WHEN a user creates a profile, THE System SHALL collect farm size, primary crops, location, and language preference
2. WHEN a user updates their profile, THE System SHALL persist changes to Firebase within 2 seconds
3. WHEN the user's location is available, THE System SHALL use it to provide location-specific recommendations
4. WHEN a user selects a language preference, THE System SHALL apply it to all text and voice interactions
5. WHEN profile data is incomplete, THE System SHALL prompt users to complete essential fields before accessing personalized features

### Requirement 9: Image Capture Guidance

**User Story:** As a farmer unfamiliar with optimal photography techniques, I want guidance on capturing good leaf images, so that the disease detection is accurate.

#### Acceptance Criteria

1. WHEN a user opens the camera interface, THE System SHALL display visual guidelines for proper leaf positioning
2. WHEN capturing an image, THE System SHALL validate image quality before allowing upload
3. IF the image is too dark, blurry, or poorly framed, THEN THE System SHALL provide specific feedback on how to improve it
4. WHEN the camera is active, THE System SHALL display tips for lighting, distance, and focus
5. WHEN an image passes quality validation, THE System SHALL provide positive feedback before proceeding to analysis

### Requirement 10: Advisory Safety and Escalation

**User Story:** As a system administrator, I want the application to operate as an advisory tool only, so that farmers understand it does not replace professional agricultural advice.

#### Acceptance Criteria

1. WHEN the application starts, THE System SHALL display a disclaimer that recommendations are advisory only
2. WHEN confidence scores are below the Low_Confidence_Threshold, THE System SHALL recommend consulting an agricultural expert
3. WHEN displaying treatment recommendations, THE System SHALL include a disclaimer about following local regulations
4. WHEN critical issues are detected, THE System SHALL provide contact information for agricultural extension services
5. WHEN users accept recommendations, THE System SHALL log the interaction for quality monitoring and improvement

### Requirement 11: Modular Service Architecture

**User Story:** As a system architect, I want the backend services to be modular and extensible, so that we can add support for new crops, regions, and languages without major refactoring.

#### Acceptance Criteria

1. WHEN adding a new crop type, THE System SHALL support it through configuration without code changes to core services
2. WHEN integrating new disease models, THE Disease_Detector SHALL load models dynamically based on crop type
3. WHEN adding regional market data sources, THE Market_Intelligence SHALL integrate new sources through a plugin architecture
4. WHEN supporting new languages, THE Voice_Interface SHALL load language models without modifying core voice processing logic
5. WHEN deploying updates, THE System SHALL support rolling updates without service interruption

### Requirement 12: Performance and Scalability

**User Story:** As a product manager, I want the system to handle growing user demand efficiently, so that we can scale to serve millions of farmers.

#### Acceptance Criteria

1. WHEN processing disease detection requests, THE System SHALL complete image inference in less than 3 seconds
2. WHEN handling end-to-end user requests, THE System SHALL respond within 5 seconds from image upload to treatment display
3. WHEN concurrent users exceed 1000, THE System SHALL maintain response times within acceptable limits through auto-scaling
4. WHEN storing user data, THE System SHALL partition data by region to support horizontal scaling
5. WHEN serving ML models, THE System SHALL cache model predictions for identical images to reduce inference costs
# Kisan Copilot – Requirements Specification

## Track
AI for Rural Innovation & Sustainable Systems

## Problem Statement
Smallholder farmers face fragmented access to crop health expertise, real-time market prices, and government scheme information. Delayed disease diagnosis, unsafe treatment practices, and lack of market visibility reduce yield and income.

A unified, low-friction, voice-first AI solution is required to provide actionable, localized, and trustworthy decision support using minimal inputs such as leaf images and speech.

## Objective
To build an AI-powered assistant that:
- Diagnoses crop diseases from leaf images
- Provides safe, explainable treatment guidance
- Shows nearby market price trends
- Recommends relevant government schemes
- Works in local languages
- Is deployable in low-bandwidth rural environments

## Target Users
- Small and marginal farmers
- Farmer Producer Organizations (FPOs)
- Rural agricultural extension officers

## Functional Requirements

### FR-1: Crop Disease Detection
- User uploads a leaf image via mobile device
- System identifies crop disease or healthy condition
- Confidence score must be displayed

### FR-2: Explainable Diagnosis
- System explains why a disease was detected
- Explanation must be understandable to non-technical users

### FR-3: Treatment Guidance
- Provide step-by-step treatment instructions
- Include dosage and safety precautions
- Support organic and chemical options where applicable

### FR-4: Market Price Intelligence
- Display recent price trends for the crop
- Identify nearest mandi/market
- Indicate trend direction (up/down/stable)

### FR-5: Government Scheme Recommendation
- Suggest schemes based on crop, season, and farmer profile
- Show eligibility summary and official source

### FR-6: Voice-Based Interaction
- Accept voice input in local languages
- Provide voice + text output
- Designed for low literacy users

## Non-Functional Requirements

### NFR-1: Safety
- System must be advisory only
- No irreversible or guaranteed outcomes
- Escalate to human expert when confidence is low

### NFR-2: Explainability
- All recommendations must include reasoning or sources

### NFR-3: Performance
- Image inference < 3 seconds
- End-to-end response < 5 seconds (network permitting)

### NFR-4: Scalability
- Modular services for easy extension to new crops and regions

### NFR-5: Deployment Readiness
- Cloud-native architecture
- Edge-friendly inference support

## Out of Scope
- Automated pesticide ordering
- Financial transactions
- Guaranteed yield prediction

## Success Metrics
- Disease classification accuracy (F1 score)
- Reduction in time-to-action
- User retention and repeat usage
- Farmer feedback and trust indicators

## Demo Scenario
1. Farmer uploads tomato leaf photo
2. System detects disease with confidence
3. Treatment steps are displayed and spoken
4. Nearby market prices are shown
5. Relevant government schemes are recommended
