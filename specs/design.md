# Kisan Copilot – System Design

## Overview
Kisan Copilot is a modular, voice-first AI system that integrates crop disease detection, explainable advisory reasoning, market intelligence, and government scheme retrieval into a single workflow designed for rural deployment.

## Architecture Summary
The system follows a cloud-based microservice architecture with an AI orchestration layer coordinating multiple specialized services.

## High-Level Architecture

- Farmer Mobile App
- API Gateway
- AI Orchestration Layer
- Data Sources & Models

## Component Design

### 1. Farmer Mobile Application
- Leaf image capture
- Voice query input
- Text and voice output
- Multilingual interface

### 2. API Gateway
- Request validation
- Language detection
- Rate limiting
- Secure routing to services

### 3. AI Orchestration Layer
Coordinates all AI services and composes the final response.

#### 3.1 Image Inference Service
- Computer vision model for crop disease detection
- Outputs disease label and confidence score

#### 3.2 Advisory Reasoning Engine
- Converts diagnosis into step-by-step treatment guidance
- Applies safety and dosage rules
- Ensures explainable recommendations

#### 3.3 Market Intelligence Service
- Fetches mandi price data
- Computes recent price trends
- Identifies nearest market

#### 3.4 Government Scheme Retrieval (RAG)
- Retrieves relevant schemes from indexed government documents
- Filters by crop, season, and farmer profile
- Provides eligibility summary and sources

#### 3.5 Voice & Language Pipeline
- Speech-to-text for voice queries
- Text-to-speech for responses
- Local language support
- Low-bandwidth optimization

### 4. Response Composer
- Aggregates outputs from all services
- Generates farmer-friendly unified response
- Supports text and voice formats

## Data Sources
- Crop disease image datasets
- Government mandi price feeds
- Government scheme documents
- Usage logs and feedback data

## Deployment Strategy
- Cloud-hosted backend services
- Optional edge inference for image models
- Containerized deployment for scalability
- Supports regional configuration per state/crop

## Safety & Trust Design
- Confidence thresholds for diagnosis
- Advisory-only recommendations
- Clear disclaimers
- Source-based scheme suggestions

## Scalability & Extensibility
- New crops and diseases can be added without redesign
- New schemes indexed via RAG pipeline
- Language modules are independently extendable

## Future Enhancements
- Yield forecasting
- Personalized crop calendars
- Community feedback learning loop
- Integration with local extension services
