from fastapi import FastAPI

app = FastAPI(title="ML Base API")


@app.get("/health")
def health() -> dict:
    return {"status": "ok"}
