#!/bin/bash

set -ouex pipefail

# mkdir -p "/var/opt" && ln -s "/var/opt"  "/opt"

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1
dnf5 -y config-manager addrepo --from-repofile=https://repo.librewolf.net/librewolf.repo
dnf5 -y config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
dnf5 -y config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo

# this installs a package from fedora repos
dnf5 -y install kitty qt6ct kvantum
dnf5 -y install mangowm noctalia-shell noctalia-qs

# dnf5 -y copr enable lukenukem/asus-linux
# dnf5 -y install asusctl supergfxctl asusctl-rog-gui
# dnf5 -y copr disable lukenukem/asus-linux
dnf5 -y --enable-repo=librewolf install librewolf
dnf5 -y --enable-repo=brave-browser install brave-browser
dnf5 -y --enable-repo=mullvad-stable install mullvad-vpn

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket

systemctl enable mullvad-daemon.service
systemctl enable mullvad-early-boot-blocking.service

