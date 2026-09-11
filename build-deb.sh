#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
OUT="$ROOT/packaging/debian"
rm -rf "$OUT"
mkdir -p "$OUT/crunchyx_0.2.0/DEBIAN" "$OUT/crunchyx_0.2.0/usr/bin" "$OUT/crunchyx_0.2.0/usr/share/applications" "$OUT/crunchyx_0.2.0/usr/share/icons/hicolor/scalable/apps"
install -m755 "$ROOT/src/crunchyx" "$OUT/crunchyx_0.2.0/usr/bin/crunchyx"
install -m644 "$ROOT/assets/crunchyx.svg" "$OUT/crunchyx_0.2.0/usr/share/icons/hicolor/scalable/apps/crunchyx.svg"
cat > "$OUT/crunchyx_0.2.0/usr/share/applications/crunchyx.desktop" <<'EOF'
[Desktop Entry]
Name=CrunchyX
Comment=Crunchyroll Chromium app
Exec=crunchyx
Icon=crunchyx
Terminal=false
Type=Application
Categories=AudioVideo;Video;Network;
StartupWMClass=CrunchyX
EOF
cat > "$OUT/crunchyx_0.2.0/DEBIAN/control" <<'EOF'
Package: crunchyx
Version: 0.2.0-1
Section: video
Priority: optional
Architecture: all
Depends: chromium | chromium-browser | google-chrome-stable
Maintainer: Chr1s0g
Description: Lightweight Chromium-based Crunchyroll app wrapper
 CrunchyX launches Crunchyroll in a dedicated Chromium app window.
EOF
chmod 00755 "$OUT/crunchyx_0.2.0/DEBIAN"
chmod 00755 "$OUT/crunchyx_0.2.0/usr/bin"
chmod 00755 "$OUT/crunchyx_0.2.0/usr/share" "$OUT/crunchyx_0.2.0/usr/share/applications" "$OUT/crunchyx_0.2.0/usr/share/icons" "$OUT/crunchyx_0.2.0/usr/share/icons/hicolor" "$OUT/crunchyx_0.2.0/usr/share/icons/hicolor/scalable" "$OUT/crunchyx_0.2.0/usr/share/icons/hicolor/scalable/apps"
dpkg-deb --build --root-owner-group "$OUT/crunchyx_0.2.0" "$OUT/crunchyx_0.2.0-1_all.deb"
