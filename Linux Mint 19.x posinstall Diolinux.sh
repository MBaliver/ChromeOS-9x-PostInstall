#!/usr/bin/env bash
# ----------------------------- VARIÁVEIS ----------------------------- #

URL_CITRIX="https://downloads.citrix.com/19434/icaclient_21.4.0.11_amd64.deb?__gda__=1623330506_9261f3e2b4089d9d8a02543914daa6e3"
URL_SIMPLE_NOTE="https://github.com/Automattic/simplenote-electron/releases/download/v2.13.0-beta2/Simplenote-linux-2.13.0-beta2-amd64.deb"

DIRETORIO_DOWNLOADS="$HOME/Downloads/Apps"

# ---------------------------------------------------------------------- #

# ----------------------------- REQUISITOS ----------------------------- #
## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Atualizando o repositório ##
sudo apt update -y

# ---------------------------------------------------------------------- #

# ----------------------------- EXECUÇÃO ----------------------------- #
## Atualizando o repositório depois da adição de novos repositórios ##
sudo apt update -y


## Download e instalaçao de programas externos ##
mkdir "$DIRETORIO_DOWNLOADS"
wget -c "$URL_CITRIX"       -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_SIMPLE_NOTE"         -P "$DIRETORIO_DOWNLOADS"

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

## Instalando pacotes Flatpak ##

sudo apt install flatpak -y
sud flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y
sudo flatpak install flathub org.kde.kdenlive -y
sudo flatpak install flathub org.glimpse_editor.Glimpse -y
sudo flatpak install flathub com.valvesoftware.Steam -y
sudo flatpak install flathub org.videolan.VLC -y
sudo flatpak install flathub io.mgba.mGBA -y
sudo flatpak install flathub io.mrarm.mcpelauncher -y
sudo flatpak install flathub nl.hjdskes.gcolor3 -y
sudo flatpak install flathub org.gnome.design.Contrast -y
sudo flatpak install flathub de.haeckerfelix.Fragments -y
sudo flatpak install flathub com.skype.Client -y
sudo flatpak install flathub io.github.lainsce.DotMatrix -y
sudo flatpak install flathub io.designer.GravitDesigner -y

# ---------------------------------------------------------------------- #

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
# ---------------------------------------------------------------------- #
