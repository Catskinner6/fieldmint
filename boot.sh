#!/bin/sh

set -e

ascii_art='
  _____ _      _     _   __  __ _       _   
 |  ___(_) ___| | __| | |  \/  (_)_ __ | |_ 
 | |_  | |/ _ \ |/ _` | | |\/| | |  _ \| __|
 |  _| | |  __/ | (_| | | |  | | | | | | |_ 
 |_|   |_|\___|_|\__,_| |_|  |_|_|_| |_|\__|
                                             
'

echo -e "$ascii_art"
echo "=> Field Mint is for a fresh install of Linux Mint Debian Edition 6 (Cinnamon) only!"
echo "=> It may work on Linux Mint 22, but has not been tested."
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Field Mint..."
rm -rf ~/.local/share/fieldmint
git clone https://github.com/catskinner6/fieldmint.git ~/.local/share/fieldmint >/dev/null
if [[ $FIELDMINT_REF != "master" ]]; then
	cd ~/.local/share/fieldmint
	git fetch origin "${FIELDMINT_REF:-stable}" && git checkout "${FIELDMINT_REF:-stable}"
	cd -
fi

echo "Installation starting..."
source ~/.local/share/fieldmint/install.sh
echo "TestChange"
