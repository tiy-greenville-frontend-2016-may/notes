#!/bin/sh

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Setting up XCode"
sudo xcodebuild -license

echo "Installing command line utilities"

# Update homebrew recipes
brew update

# Install Bash 4
brew install bash

brew install node
brew install git

brew cleanup

brew install caskroom/cask/brew-cask

brew tap caskroom/versions

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" slack
