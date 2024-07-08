#!/bin/zsh

# Print settings with 'defaults read'

# Close any system preference windows first
osascript -e 'tell application "System Preferences" to quit'

# Become root
sudo -v

# Stay root
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


### System ###

# Set the startup sound volume to zero
sudo nvram StartupMute=%01


### Battery ###
# Prevent automatic sleeping on power adapter when the display is off
sudo pmset -c displaysleep 0
sudo pmset -c sleep 0
sudo pmset -c disablesleep 1

# Never wake for network access
sudo pmset -a womp 0


### Dock settings ###
# Automatically hide and show the Dock:
defaults write com.apple.dock autohide -bool true

# Remove the autohide delay:
defaults write com.apple.dock autohide-delay -float 0

# Effect for minimizing windows
defaults write com.apple.dock mineffect -string scale

# Enable minimizing windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# Disable showing suggested and recent apps in Dock
defaults write com.apple.dock show-recents -bool false


### Control bar ###
# Show battery percentage in the menu bar
defaults write com.apple.controlcenter "BatteryShowPercentage" -bool true

# Hide the Spotlight icon from the menu bar
defaults write com.apple.Spotlight MenuItemHidden -bool true

# Display time with seconds in the menu bar clock
defaults write com.apple.menuextra.clock ShowSeconds -bool true

# Disable natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

### Keyboard ###
# Set the initial key repeat rate
# A lower number means a faster repeat rate
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Optionally, set the key repeat rate (this is the speed at which keys repeat)
defaults write NSGlobalDomain KeyRepeat -int 2


### Finder ###
# Set the default Finder window location to Downloads
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads/"

# Hide external disks from the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false

# Hide CDs, DVDs, and iPods from the desktop
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Show all file extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Set Finder to search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true


### Set default app for files ###
# VLC
duti -s org.videolan.vlc .avi all
duti -s org.videolan.vlc .mkv all
duti -s org.videolan.vlc .mp4 all


### Apply all ###
# Restart the system preferences daemon to apply the changes
killall -HUP cfprefsd
# Restart the Dock to apply the changes:
killall Dock
# Restart SystemUIServer to apply the changes
killall SystemUIServer
# Restart Finder
killall Finder
