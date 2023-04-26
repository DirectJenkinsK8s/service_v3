from hashlib import md5

from service_v3.service.md5_service import generate_md5_hash


def test_md5_service_wihout_prefix():
    input = "test_input"
    expected = md5(f"default_prefix_{input}".encode()).hexdigest()

    actual = generate_md5_hash(input)

    assert actual == expected
