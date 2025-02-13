export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR='nvim'
export XDG_CONFIG_HOME="$HOME/.config"

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
export DISABLE_UPDATE_PROMPT="true"
export HIST_STAMPS="yyyy-mm-dd HH:MM:SS"

eval "$(/opt/homebrew/bin/brew shellenv)"

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/config.toml"
eval "$(starship init zsh)"

export PATH="$XDG_CONFIG_HOME/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="$XDG_CONFIG_HOME/herd-lite/bin:$PHP_INI_SCAN_DIR"
export PATH="/Users/tom/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/tom/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

eval "$(direnv hook zsh)"

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
eval "$(go env)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"  # This loads nvm zsh_completion
