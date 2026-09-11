#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
command -v pacman >/dev/null || { echo "Arch Linux required."; exit 1; }
sudo pacman -S --needed chromium
install -Dm755 "$ROOT/src/crunchyx" "$HOME/.local/bin/crunchyx"
install -Dm644 "$ROOT/assets/crunchyx.svg" "$HOME/.local/share/icons/hicolor/scalable/apps/crunchyx.svg"
install -Dm644 /dev/stdin "$HOME/.local/share/applications/crunchyx.desktop" <<EOF
[Desktop Entry]
Name=CrunchyX
Comment=Crunchyroll Chromium app
Exec=$HOME/.local/bin/crunchyx
Icon=crunchyx
Terminal=false
Type=Application
Categories=AudioVideo;Video;Network;
StartupWMClass=CrunchyX
EOF
command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database "$HOME/.local/share/applications" || true
echo "Installed. Try: crunchyx --version"
