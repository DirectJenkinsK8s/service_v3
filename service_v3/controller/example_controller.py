from fastapi import APIRouter

from service_v3.service.md5_service import generate_md5_hash

router = APIRouter()


@router.get("/ping")
async def send_ping() -> str:
    """
    Test service
    """
    return "Pong"


@router.get("/md5hash/{value}")
async def md5_controller(value: str, prefix: str | None = None):
    if prefix:
        return generate_md5_hash(value, prefix)
    else:
        return generate_md5_hash(value)
