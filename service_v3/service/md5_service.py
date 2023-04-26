from hashlib import md5


def generate_md5_hash(input_text: str, prefix: str = "default_prefix") -> str:
    return md5(f"{prefix}_{input_text}".encode()).hexdigest()
