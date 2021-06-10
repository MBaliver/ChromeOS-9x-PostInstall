#!/usr/bin/env bash
# ----------------------------- VARIÁVEIS ----------------------------- #

URL_CITRIX="https://drive.google.com/file/d/1wFSyxPJeV7F4SB8DTEsMf9qhdN8aD8jU/view?usp=sharing"

DIRETORIO_DOWNLOADS="/mnt/chromeos/MyFiles/Downloads/Apps"

# ---------------------------------------------------------------------- #

# ----------------------------- REQUISITOS ----------------------------- #

## Atualizando o repositório ##
sudo apt update -y

## Instalando o Flatpak ##
sudo apt install flatpak -y
sudo flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# ---------------------------------------------------------------------- #

# ----------------------------- EXECUÇÃO ----------------------------- #
## Atualizando o repositório depois da adição de novos repositórios ##
sudo apt update -y

## Download e instalaçao de programas externos ##
mkdir "$DIRETORIO_DOWNLOADS"
wget --no-check-certificate "$URL_CITRIX" -O citrix.deb -P "$DIRETORIO_DOWNLOADS"

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

## Instalando pacotes Flatpak ##

sudo flatpak install flathub -y org.kde.kdenlive
sudo flatpak install flathub -y com.simplenote.Simplenote 
sudo flatpak install flathub -y org.glimpse_editor.Glimpse 
sudo flatpak install flathub -y com.valvesoftware.Steam
sudo flatpak install flathub -y org.videolan.VLC
sudo flatpak install flathub -y org.inkscape.Inkscape
sudo flatpak install flathub -y io.mgba.mGBA
sudo flatpak install flathub -y io.mrarm.mcpelauncher
sudo flatpak install flathub -y nl.hjdskes.gcolor3
sudo flatpak install flathub -y org.gnome.design.Contrast
sudo flatpak install flathub -y de.haeckerfelix.Fragments
sudo flatpak install flathub -y com.skype.Client
sudo flatpak install flathub -y io.github.lainsce.DotMatrix
sudo flatpak install flathub -y io.designer.GravitDesigner

# ---------------------------------------------------------------------- #

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
# ---------------------------------------------------------------------- #
