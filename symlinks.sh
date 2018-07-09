#!/usr/bin/env bash
# ln -s /path/to/original /path/to/symlink

dotfilepath="$HOME/Workspace/dotfiles"

if [[ -d "$dotfilepath" ]]; then
  echo "linking dotfiles from $dotfilepath"
else
  echo "$dotfilepath does not exist"
  exit 1
fi

ln -s $HOME/Workspace/dotfiles/aliases.zsh $ZSH_CUSTOM/aliases.zsh
ln -s $HOME/Workspace/dotfiles/functions.zsh $ZSH_CUSTOM/functions.zsh
ln -s $HOME/Workspace/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/Workspace/dotfiles/.zshrc $HOME/.zshrc
