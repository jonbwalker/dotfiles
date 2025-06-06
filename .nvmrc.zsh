# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local current_node_version nvmrc_path nvmrc_node_version

  current_node_version="$(nvm version)"
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    nvmrc_node_version="$(nvm version "$(cat "${nvmrc_path}")")"

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$current_node_version" ]; then
      nvm use
    fi
  else
    local default_version="$(nvm version default)"
    if [ "$current_node_version" != "$default_version" ]; then
      echo "Reverting to nvm default version"
      nvm use default
    fi
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
