# This is Smittix's Setup Script - www.smittix.co.uk
# You can conctact him at smittix@fedoraproject.org
# I have been tested this script (not at all) on Fedora 23. All is ok!
 
# dnf Fastest Mirror Plugin
dnf install -y yum-plugin-fastestmirror
 
# Gnome Tweak Tool and a few customizations
dnf install -y gnome-tweak-tool
dnf install -y terminus-fonts
dnf install -y elementary-icon-theme
dnf install -y gnome-shell-theme*
 
# Fedy
dnf install -y curl
curl https://satya164.github.io/fedy/fedy-installer -o fedy-installer && chmod +x fedy-installer && ./fedy-installer
 
#RPM Fusion Repos
dnf localinstall -y --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
 
#Update the system
dnf update -y dnf
dnf update -y
 
#Plymouth Themes
dnf install -y plymouth-theme*
 
#Photography Software
dnf install -y gimp
dnf install -y inkscape
dnf install -y ufraw
dnf install -y luminance-hdr
dnf install -y darktable
 
#Video Editing
dnf install -y pitivi
dnf install -y kdenlive
 
#Virtualisation
dnf install -y @virtualization
dnf install -y libvirt
 
#Utilities
dnf install -y alsa-tools
dnf install -y tomboy
dnf install -y deja-dup
 
#Games
dnf install -y chromium-bsu
dnf install -y frozen-bubble
dnf install -y dosbox
 
#Internet
dnf install -y transmission
dnf install -y thunderbird
dnf install -y remmina
dnf install -y remmina-plugins*
 
#Multimedia
dnf install -y vlc
dnf install -y sound-juicer
dnf install -y audacity
 
#Nautilus Addons
dnf install -y nautilus-actions
 
#Youtube Downloader
dnf install -y youtube-dl
 
 
#Spotify Repo
dnf-config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo
 
#Install Spotify
dnf install -y spotify-client
 
#Lets make the fonts look a little better
#gsettings set org.gnome.desktop.interface document-font-name 'Sans 10'
#gsettings set org.gnome.desktop.interface font-name 'Cantarell 10'
#gsettings set org.gnome.desktop.interface monospace-font-name 'Terminus 10'
#gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Cantarell 10'
#gsettings set org.gnome.settings-daemon.plugins.xsettings hinting 'slight'
#gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing 'rgba'
 
#Adding the date and seconds to the clock
#gsettings set org.gnome.desktop.interface clock-show-date
#gsettings set org.gnome.desktop.interface clock-show-seconds
