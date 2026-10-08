#!/bin/bash

set -ouex pipefail

# mkdir -p "/var/opt" && ln -s "/var/opt"  "/opt"

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1
#dnf5 -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release terra-gpg-keys
dnf5 -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
dnf5 -y config-manager addrepo --from-repofile=https://repo.librewolf.net/librewolf.repo
dnf5 -y config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
dnf5 -y config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo
# dnf5 -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
# dnf5 -y install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# this installs a package from fedora repos

dnf5 -y install  kvantum cliphist qt6ct niri #ffmpegthumbnailer kitty
#dnf5 -y install @virtualization
#dnf5 -y install --repo=updates niri

dnf5 -y --enable-repo=librewolf install librewolf
dnf5 -y --enable-repo=brave-browser install brave-browser
dnf5 -y --enable-repo=mullvad-stable install mullvad-vpn
dnf5 -y --enable-repo=terra install noctalia mpvpaper nwg-look #mangowm supergfxctl asusctl asusctl-rog-gui
#dnf5 -y --releasever=rawhide --enable-repo=terra install noctalia-shell mangowm asusctl asusctl-rog-gui supergfxctl

# dnf5 -y copr enable lukenukem/asus-linux
# dnf5 -y install asusctl asusctl-rog-gui #supergfxctl
# dnf5 -y copr disable lukenukem/asus-linux
#
# dnf5 -y copr enable lionheartp/Hyprland
# dnf5 -y install hyprland uwsm #cliphist qt6ct
# dnf5 -y copr disable lionheartp/Hyprland

# dnf5 -y copr enable yalter/niri-git
# dnf5 -y install niri
# dnf5 -y copr disable yalter/niri-git

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

