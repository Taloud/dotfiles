source ~/.dotfiles/zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Node manager
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nvim')
export NVM_AUTO_USE=true
antigen bundle lukechilds/zsh-nvm

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle docker

# Useful bundles.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# Activate direnv
eval "$(direnv hook zsh)"

# remove user in front of path
DEFAULT_USER=$USER
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0'
# Load aliases
source ~/.dotfiles/zsh/zsh_aliases
export PATH="/usr/local/sbin:$PATH"
export BAT_THEME="gruvbox-dark"
export ZSH=$HOME/.oh-my-zsh
export DOTFILES=$HOME/.dotfiles
source $HOME/.zsh_profile
export REVIEW_BASE=dev-master

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export YVM_DIR=/home/taloud/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh
