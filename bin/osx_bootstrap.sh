#!/usr/bin/env bash
# 
# Matt's Bootstrap script for setting up a new OSX machine
# 
# This should be idempotent so it can be run multiple times.
#
# Some apps don't have a cask and so still need to be installed by hand. These
# include:
#
# Notes:
#
# - If installing full Xcode, it's better to install that first from the app
#   store before running the bootstrap script. Otherwise, Homebrew can't access
#   the Xcode libraries as the agreement hasn't been accepted yet.
#
# Reading:
#
# -- https://gist.github.com/codeinthehole/26b37efa67041e1307db
# -- http://www.andrewboni.com/2017/01/01/essential-programs-to-install-on-a-new-macbook-for-engineers/
# -- https://danielmiessler.com/blog/first-10-things-new-mac/

echo "Starting bootstrapping"

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

PACKAGES=(
    the_silver_searcher
    tmux
    tree
    vim
    neovim
    wget
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing cask..."
brew tap caskroom/cask

CASKS=(
    flux
    google-chrome
    slack
    vlc
)

echo "Installing cask apps..."
brew cask install ${CASKS[@]}

echo "Installing fonts..."
brew tap caskroom/fonts
FONTS=(
    font-inconsolata
)
brew cask install ${FONTS[@]}

#echo "Installing Python packages..."
#PYTHON_PACKAGES=(
#    ipython
#    virtualenv
#    virtualenvwrapper
#)
#sudo pip install ${PYTHON_PACKAGES[@]}
#
#echo "Installing Ruby gems"
#RUBY_GEMS=(
#    bundler
#    filewatcher
#    cocoapods
#)
#sudo gem install ${RUBY_GEMS[@]}
#
#echo "Installing global npm packages..."
#npm install marked -g
#
#echo "Configuring OSX..."
#
## Set fast key repeat rate
#defaults write NSGlobalDomain KeyRepeat -int 0
#
## Require password as soon as screensaver or sleep mode starts
#defaults write com.apple.screensaver askForPassword -int 1
#defaults write com.apple.screensaver askForPasswordDelay -int 0
#
## Show filename extensions by default
#defaults write NSGlobalDomain AppleShowAllExtensions -bool true
#
## Enable tap-to-click
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
#defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
#
## Disable "natural" scroll
#defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
#
#echo "Creating folder structure..."
#[[ ! -d Wiki ]] && mkdir Wiki
#[[ ! -d Workspace ]] && mkdir Workspace

echo "Bootstrapping complete"
