#!/usr/bin/env bash
# INRain launcher - run .inr / .inrain files on Linux/macOS
# Usage: ./INRain.sh myscript.inr   (or, after setup, just: INRain myscript.inr)

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -z "$1" ]; then
    echo "INRain - usage: INRain yourfile.inr"
    exit 1
fi

# Prefer python3, fall back to python
if command -v python3 >/dev/null 2>&1; then
    PYTHON=python3
elif command -v python >/dev/null 2>&1; then
    PYTHON=python
else
    echo "Error: Python 3 is not installed or not on PATH."
    exit 1
fi

"$PYTHON" "$SCRIPT_DIR/inrain.py" "$@"
