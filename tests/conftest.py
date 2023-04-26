import pytest
from starlette.testclient import TestClient

from service_v3.main import app


@pytest.fixture(scope="module")
def test_app():
    client = TestClient(app)
    yield client
