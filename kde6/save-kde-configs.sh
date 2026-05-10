#!/bin/bash
# save-kde.sh

DOTFILES=~/dotfiles
KDE=$DOTFILES/kde6/.config
KONSOLE_CONF=$DOTFILES/konsole/.config
KONSOLE_DATA=$DOTFILES/konsole/.local/share/konsole

mkdir -p $KDE $KONSOLE_CONF $KONSOLE_DATA

KDE_FILES=(
  kdeglobals
  kwinrc
  plasmashellrc
  plasma-org.kde.plasma.desktop-appletsrc
  kglobalshortcutsrc
  khotkeysrc
  kcminputrc
  kxkbrc
  powerdevilrc
  powermanagementprofilesrc
)

for f in "${KDE_FILES[@]}"; do
  [[ -f ~/.config/$f ]] && cp ~/.config/$f $KDE/
done

# Konsole
[[ -f ~/.config/konsolerc ]] && cp ~/.config/konsolerc $KONSOLE_CONF/
cp ~/.local/share/konsole/*.profile $KONSOLE_DATA/ 2>/dev/null

echo "Done"
