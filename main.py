from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
def health_check():
    return {"status": "secure", "framework": "FastAPI", "version": "1.0.0"}