#!/usr/bin/env bash
# Run this ONCE to make "INRain" work from any folder on Linux/macOS.
# It creates a small wrapper called "INRain" on your PATH (in ~/.local/bin
# by default) that points back to this folder — works well for a USB drive
# too, as long as the drive stays mounted at the same path.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$HOME/.local/bin"

mkdir -p "$BIN_DIR"

WRAPPER="$BIN_DIR/INRain"
cat > "$WRAPPER" <<EOF
#!/usr/bin/env bash
exec "$SCRIPT_DIR/INRain.sh" "\$@"
EOF
chmod +x "$WRAPPER"
chmod +x "$SCRIPT_DIR/INRain.sh"

echo "Installed wrapper at $WRAPPER"

# Make sure ~/.local/bin is on PATH
SHELL_RC=""
case "$SHELL" in
    */zsh) SHELL_RC="$HOME/.zshrc" ;;
    */bash) SHELL_RC="$HOME/.bashrc" ;;
    *) SHELL_RC="$HOME/.profile" ;;
esac

if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    if ! grep -q 'export PATH="\$HOME/.local/bin:\$PATH"' "$SHELL_RC" 2>/dev/null; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"
        echo "Added $BIN_DIR to PATH in $SHELL_RC"
    fi
fi

echo
echo "Done! Close and reopen your terminal (or run: source $SHELL_RC)"
echo "Then you can cd anywhere and type:"
echo "    INRain myscript.inr"
echo
