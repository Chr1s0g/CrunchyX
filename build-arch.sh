#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
OUT="$ROOT/packaging/arch"
rm -rf "$OUT"
mkdir -p "$OUT"
cp "$ROOT/src/crunchyx" "$OUT/crunchyx"
cp "$ROOT/assets/crunchyx.svg" "$OUT/crunchyx.svg"
cat > "$OUT/PKGBUILD" <<'EOF'
pkgname=crunchyx
pkgver=0.2.0
pkgrel=1
pkgdesc='Lightweight Chromium-based Crunchyroll app wrapper'
arch=('any')
license=('MIT')
depends=('chromium')
source=('crunchyx' 'crunchyx.svg')
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm755 "$srcdir/crunchyx" "$pkgdir/usr/bin/crunchyx"
  install -Dm644 "$srcdir/crunchyx.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/crunchyx.svg"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/crunchyx.desktop" <<'DESKTOP'
[Desktop Entry]
Name=CrunchyX
Comment=Crunchyroll Chromium app
Exec=crunchyx
Icon=crunchyx
Terminal=false
Type=Application
Categories=AudioVideo;Video;Network;
StartupWMClass=CrunchyX
DESKTOP
}
EOF
cd "$OUT"
makepkg -f
