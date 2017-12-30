#!/bin/bash

#commands
#PS1='\h:\W \$ '
alias vi='nvim'
alias R='R --no-save'
alias ls='ls -1'
alias ll='ls -al'

# hidden files
alias showhidden='defaults write com.apple.Finder AppleShowAllFiles TRUE; killall Finder'
alias hidehidden='defaults write com.apple.Finder AppleShowAllFiles FALSE; killall Finder'

# reset the camera
alias reset_camera='sudo killall VDCAssistant'
