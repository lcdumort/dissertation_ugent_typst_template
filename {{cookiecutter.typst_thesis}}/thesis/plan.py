#!/usr/bin/env python3
from stepup.core.api import script, static, glob
from stepup.reprep.api import compile_typst

# Manually created files used as input.
static("./logos/")
static("./references.bib")
static("./papers/")
glob("./*.typ")
glob("./logos/*.png")
glob("./papers_svg/")

glob("./scripts/")
glob("./papers/*.pdf")

for m in glob("./scripts/${*script}.py"):
    print(m.script)
    script(f"{m.script}.py", workdir="./scripts/")

# Compile the PDF.
compile_typst("thesis/main.typ")
