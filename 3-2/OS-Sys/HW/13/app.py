import os

secret_user = os.getenv("secret_user", "Unknown")
print(f"Hello, {secret_user}!")
