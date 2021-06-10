#!/usr/bin/env bash
# ----------------------------- VARIÁVEIS ----------------------------- #



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
