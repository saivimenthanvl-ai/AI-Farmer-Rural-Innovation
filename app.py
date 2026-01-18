from fastapi import FastAPI, UploadFile, File
from pydantic import BaseModel
from typing import List

class DemoResponse(BaseModel):
    disease: str
    confidence: float
    steps: List[str]
    market_prices: dict
    schemes: List[str]

@app.post("/demo", response_model=DemoResponse)
async def demo_pipeline(file: UploadFile = File(...)):
    """
    Demo pipeline:
    Leaf Image → Diagnosis → Advisory → Market → Schemes
    """

    # ---- MOCK CV INFERENCE ----
    disease = "Leaf Blight"
    confidence = 0.87

    # ---- ADVISORY ENGINE ----
    steps = [
        "Remove infected leaves",
        "Avoid overhead irrigation",
        "Apply recommended fungicide",
        "Monitor crop for 7 days"
    ]

    # ---- MARKET INTELLIGENCE ----
    market_prices = {
        "crop": "Tomato",
        "nearby_market": "Salem",
        "price_per_kg": 28,
        "trend": "Increasing"
    }

    # ---- SCHEME RAG ----
    schemes = [
        "PMFBY Crop Insurance Scheme",
        "Soil Health Card Scheme",
        "State Horticulture Subsidy"
    ]

    return DemoResponse(
        disease=disease,
        confidence=confidence,
        steps=steps,
        market_prices=market_prices,
        schemes=schemes
    )
