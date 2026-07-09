import great_expectations as gx
from pathlib import Path

gx_path = Path.cwd() / "gx"

context = gx.get_context(
    mode="file",
    context_root_dir=gx_path
)

print(context)