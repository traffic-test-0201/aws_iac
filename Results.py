from fastapi import APIRouter, Path

router = APIRouter(prefix="/results", tags=["Results"])
metadata_results = {
    "name" : "Results API Version 1",
    "description": "Version 1 Results API"
}

@router.post(
    path="", summary="POST Results"
)
async def register_Results():
    return {"message": "Register Results"}