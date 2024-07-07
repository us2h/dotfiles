#!/bin/zsh

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Apps and Dependencies
brew bundle

# Configire MAC
./macos_configuration.zsh
