from fastapi import FastAPI

from service_v3.controller.example_controller import router
from service_v3.core.config import settings

app = FastAPI(
    title=settings.PROJECT_NAME,
    openapi_url=f"{settings.API_V1_STR}/openapi.json",
)

app.include_router(router, prefix=settings.API_V1_STR)
