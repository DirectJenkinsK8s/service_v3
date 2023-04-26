from service_v3.controller import example_controller


def test_ping(test_app):
    response = test_app.get("/api/v1/ping")
    assert response.status_code == 200
    assert response.json() == "Pong"


def test_md5_controller(test_app, monkeypatch):
    expected = "md5_test_input_default_prefix"

    def mock_get_md5_hash(input_text: str, prefix: str = "default_prefix") -> str:
        return f"md5_{input_text}_{prefix}"

    monkeypatch.setattr(example_controller, "generate_md5_hash", mock_get_md5_hash)

    response = test_app.get("/api/v1/md5hash/test_input")
    assert response.status_code == 200
    assert response.json() == expected
