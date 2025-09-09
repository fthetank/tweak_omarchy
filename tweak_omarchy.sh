# set -Ee
# Remove unwanted default webapps and apps
set -uo pipefail # Do not use set -e, we want to continue on error
# Trap all ERR conditions and call the handler
trap 'on_error $LINENO "$BASH_COMMAND"' ERR

on_error() {
  local lineno="$1"
  local cmd="$2"

  # Set colors
  RED=$(tput setaf 1)
  YELLOW=$(tput setaf 3)
  RESET=$(tput sgr0)

  echo
  echo "${RED}⚠️ ERROR DETECTED${RESET}"
  echo "${YELLOW}✳️  Line: $lineno"
  echo "📌  Command: '$cmd'"
  echo "⏳  Waiting 10 seconds before continuing...${RESET}"
  echo

  sleep 10
}

# Remove unwanted default webapps and apps

echo
tput setaf 2
echo "################################################################################"
echo "Removing unwanted webapps"
echo "################################################################################"
tput sgr0
echo

omarchy-webapp-remove Figma
omarchy-webapp-remove HEY
omarchy-webapp-remove spotify
omarchy-webapp-remove X
omarchy-webapp-remove Zoom
omarchy-webapp-remove Basecamp
#omarchy-webapp-remove figma
# Remove unwanted apps

echo
tput setaf 2
echo "################################################################################"
echo "Removing unwanted apps"
echo "################################################################################"
tput sgr0
echo

omarchy-pkg-drop 1password-beta
omarchy-pkg-drop password-cli

# install additional packages
echo
tput setaf 2
echo "################################################################################"
echo "Updating the system - sudo pacman -Syyu"
echo "################################################################################"
tput sgr0
echo
sudo pacman -Syyu --noconfirm

echo
tput setaf 2
echo "################################################################################"
echo "Installing additional software"
echo "################################################################################"
tput sgr0
echo

#first get devtools and systemtools
yay -S --noconfirm --needed sublime-text-4
sudo pacman -S --noconfirm --needed ripgrep
sudo pacman -S --noconfirm --needed meld
sudo pacman -S --noconfirm --needed baobab
sudo pacman -S --noconfirm --needed gzip
sudo pacman -S --noconfirm --needed p7zip
sudo pacman -S --noconfirm --needed unace
sudo pacman -S --noconfirm --needed unrar
sudo pacman -S --noconfirm --needed unzip
sudo pacman -S --noconfirm --needed fish
sudo pacman -S --noconfirm --needed gnome-disk-utility
sudo pacman -S --noconfirm --needed gparted
yay -S --noconfirm --needed mintstick
sudo pacman -S --noconfirm --needed rsync
sudo pacman -S --noconfirm --needed qbittorrent
yay -S --noconfirm --needed rate-mirrors
sudo pacman -S --noconfirm --needed visual-studio-code-bin
sudo pacman -S --noconfirm --needed vlc
sudo pacman -S --noconfirm --needed shortwave
yay -S --noconfirm --needed hypnotix-wayland
yay -S --noconfirm --needed wlogout
sudo pacman -S --noconfirm --needed libreoffice-fresh
sudo pacman -S --noconfirm --needed libreoffice-fresh-de
sudo pacman -S --noconfirm --needed thunar
sudo pacman -S --noconfirm --needed thunar-archive-plugin
sudo pacman -S --noconfirm --needed thunar-volman
sudo pacman -S --noconfirm --needed file-roller
sudo pacman -S --noconfirm --needed micro
sudo pacman -S --noconfirm --needed nano

# nautilus extension for minimal conviniency

yay -S --noconfirm --needed nautilus-open-any-terminal
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty

# further tools and software
sudo pacman -S --noconfirm --needed nwg-look
yay -S --noconfirm --needed brave-bin
yay -S --noconfirm --needed joplin-bind
sudo pacman -S --noconfirm --needed gimp

# look and feel + eyecandy
yay -S --noconfirm --needed bibata-cursor-theme
sudo pacman -S --noconfirm --needed font-manager
sudo pacman -S --noconfirm --needed ttf-dejavu
sudo pacman -S --noconfirm --needed ttf-droid
sudo pacman -S --noconfirm --needed ttf-hack
sudo pacman -S --noconfirm --needed ttf-liberation
yay -S --noconfirm --needed ttf-ms-fonts
sudo pacman -S --noconfirm --needed ttf-roboto
sudo pacman -S --noconfirm --needed ttf-roboto-mono
sudo pacman -S --noconfirm --needed ttf-ubuntu-font-family
yay -S --noconfirm --needed beautyline

## copy personal settings
echo
tput setaf 2
echo "################################################################################"
echo "Copy personal settings"
echo "################################################################################"
tput sgr0
echo
cp -rf ./config/* ~/.config/
cp -f ./bash/.bashrc ~/
