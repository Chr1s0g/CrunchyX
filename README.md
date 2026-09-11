# CrunchyX 0.2.0

Clean Chromium-based Crunchyroll desktop wrapper for Linux.

## Arch package

    ./build-arch.sh

Then:

    sudo pacman -U packaging/arch/crunchyx-0.2.0-1-any.pkg.tar.zst

After installation:

    crunchyx --version
    crunchyx --diagnose

CrunchyX should also appear in the desktop application menu.

## Debian/Ubuntu

    ./build-deb.sh
    sudo apt install ./packaging/debian/crunchyx_0.2.0-1_all.deb
