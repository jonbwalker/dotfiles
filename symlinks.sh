#!/usr/bin/env bash
# ln -s /path/to/original /path/to/symlink
# readlink -v .zsh-config
#https://www.scivision.dev/repairing-broken-symbolic-link-linux/

dotfilepath="$HOME/Workspace/dotfiles"

if [[ -d "$dotfilepath" ]]; then
  echo "linking dotfiles from $dotfilepath"
else
  echo "$dotfilepath does not exist"
  exit 1
fi

#ln -s $HOME/Workspace/dotfiles/.aliases.zsh $ZSH_CUSTOM/.aliases.zsh
ln -s $dotfilepath/.zsh-config.zsh $HOME/.zsh-config.zsh
ln -s $dotfilepath/.functions.zsh $HOME/.functions.zsh
ln -s $dotfilepath/.gitconfig $HOME/.gitconfig
ln -s $dotfilepath/.zshrc $HOME/.zshrc
ln -s $dotfilepath/.vimrc $HOME/.vimrc
ln -s $dotfilepath/.aliases.zsh $HOME/.aliases.zsh
ln -s $dotfilepath/.nvmrc.zsh $HOME/.nvmrc.zsh
