🌾 AI Farmer – Rural Innovation & Sustainable Systems
(Kisan Copilot)

AI Farmer (Kisan Copilot) is an AI-powered assistant for farmers designed to improve crop health decisions, market awareness, and access to government schemes using computer vision, AI reasoning, and localized insights.

This project was built as part of TechSprint by Google Developer Groups on Campus, under the track:

AI for Rural Innovation & Sustainable Systems

🚀 Live Demo

🌐 Web App (Flutter Web)
👉 https://ai-farmer-kisan-copilot.web.app

🔗 Backend API (FastAPI on Render)
👉 https://kisan-copilot-backend.onrender.com

👉 Swagger UI: https://kisan-copilot-backend.onrender.com/docs

🎯 Problem Statement

Farmers often face:

Delayed or incorrect crop disease diagnosis

Lack of actionable treatment guidance

No real-time market price awareness

Difficulty discovering relevant government schemes

Language barriers in accessing agricultural information

💡 Solution Overview

AI Farmer provides an end-to-end AI advisory flow:

Upload Leaf Photo → Disease Diagnosis → Treatment Steps → Nearby Market Price Trends → Govt Scheme Suggestions → Voice Summary (Local Language)

All insights are delivered in a simple, farmer-friendly interface.

🧠 Key Features
📷 Crop Disease Diagnosis

Upload a leaf photo

AI detects disease and confidence score

Visual explanation of why the disease was identified

🧪 Treatment Guidance

Step-by-step actionable treatment instructions

Safety precautions included

Option to listen in Tamil (voice output)

📈 Market Intelligence

Nearest mandi price trends

Day-over-day comparison

AI suggestion (Hold / Sell)

🏛️ Government Scheme Discovery

Relevant schemes suggested automatically

Official source links included

Context-aware eligibility hints

🎙️ Voice Summary

Concise spoken summary of diagnosis, market trend, and schemes

Designed for low-literacy and accessibility use cases

🖼️ Screenshots
🏠 Home

🌿 Diagnosis Result

🧪 Treatment Guidance

📊 Market Prices & Schemes

🔊 Voice Summary

🏗️ Architecture (High Level)
<img width="3148" height="1820" alt="image" src="https://github.com/user-attachments/assets/1f257370-0aba-4fc3-99a5-a15e10a3b579" />

🧪 Demo API Flow

Endpoint: /demo

Input:

Image (mocked in MVP)

Output:

{
  "disease": "Early Blight",
  "confidence": 83,
  "steps": [
    "Remove infected leaves",
    "Improve airflow",
    "Apply fungicide"
  ],
  "market_prices": {
    "crop": "Tomato",
    "price": 2520,
    "trend": "Slight Increase"
  },
  "schemes": [
    "PM-KISAN",
    "Soil Health Card Scheme"
  ]
}

🛠️ Tech Stack
Frontend

Flutter (Mobile + Web)

Firebase Hosting

Backend

FastAPI (Python)

Render (Deployment)

AI / Logic

Computer Vision (MVP placeholder)

Rule-based reasoning (extensible to ML/RAG)

Multilingual voice-ready pipeline

🌱 Sustainability & Rural Impact

Reduces crop loss through early diagnosis

Empowers farmers with data-driven selling decisions

Improves awareness of government benefits

Designed for low bandwidth & local language access

🔮 Future Enhancements

Real CNN-based disease detection

Yield forecasting models

Personalized crop calendars

Farmer feedback learning loop

Offline-first support

👨‍💻 Author

Sai Vimenthan V L
AI / ML Developer | Rural AI Enthusiast

📜 License

This project is released for hackathon and educational purposes.
