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
sudo flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y kdenlive
sudo flatpak install -y Glimpse 
sudo flatpak install -y Steam
sudo flatpak install -y VLC
sudo flatpak install -y Inkscape
sudo flatpak install -y mGBA
sudo flatpak install -y mcpelauncher
sudo flatpak install -y gcolor3
sudo flatpak install -y Contrast
sudo flatpak install -y Fragments
sudo flatpak install -y Skype
sudo flatpak install -y DotMatrix
sudo flatpak install -y GravitDesigner

# ---------------------------------------------------------------------- #

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
# ---------------------------------------------------------------------- #
