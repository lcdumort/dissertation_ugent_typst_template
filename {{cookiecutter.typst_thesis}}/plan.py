#!/usr/bin/env python3
from stepup.core.api import amend, copy, script, static, step
from stepup.reprep.api import compile_typst

# Manually created files used as input.
static("thesis/*.typ")

# Compile the PDF.
compile_typst("thesis/main.typ")
