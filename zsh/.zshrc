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
# antigen bundle jeffreytse/zsh-vi-mode

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
VI_MODE_SET_CURSOR=true
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# Activate direnv
eval "$(direnv hook zsh)"

# Decrease delay that vi-mode waits for the end of a key sequence
export KEYTIMEOUT=15

# remove user in front of path
DEFAULT_USER=$USER
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0'
# Load aliases
source ~/.dotfiles/zsh/zsh_aliases
export PATH="/usr/local/sbin:$HOME/.local/bin:$PATH"
export BAT_THEME="gruvbox-dark"
export ZSH=$HOME/.oh-my-zsh
export DOTFILES=$HOME/.dotfiles
source $HOME/.zsh_profile
export REVIEW_BASE=dev-master

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export YVM_DIR=/home/taloud/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

#--------------------------------------------------------------------------
# Aliases
#--------------------------------------------------------------------------

alias cat="bat"
alias finder="nautilus ."
alias testing='git tag -d testing && git push origin :refs/tags/testing && git tag testing'

#--------------------------------------------------------------------------
# Miscellaneous
#--------------------------------------------------------------------------

### Use multiple nvim conf on load
function nvims() {
  items=("default" "playground" "renew")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height 10% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes
alias luamake=/home/taloud/git/lua-language-server/3rd/luamake/luamake

# bun completions
[ -s "/home/taloud/.bun/_bun" ] && source "/home/taloud/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
