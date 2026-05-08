#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 -y install kitty
dnf5 -y install qt6ct
dnf5 -y install kvantum
dnf5 -y --enable-repo=brave-browser install brave-browser
dnf5 -y --enable-repo=librewolf install librewolf
dnf5 -y --enable-repo=mullvad-stable install mullvad-vpn
dnf5 -y --enable-repo=terra install mangowm
dnf5 -y --enable-repo=terra install noctalia-shell

dnf5 -y copr enable lukenukem/asus-linux
dnf5 -y install asusctl supergfxctl
dnf5 -y install asusctl-rog-gui
dnf5 -y copr disable lukenukem/asus-linux

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
