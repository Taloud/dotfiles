# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Enable brew autocompletion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zi snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::nvm
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey "^[[3~" delete-char

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias c='clear'

eval "$(fzf --zsh)"
eval "$(task --completion zsh)"

#--------------------------------------------------------------------------
# Configurations
#--------------------------------------------------------------------------

# Activate direnv
eval "$(direnv hook zsh)"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
VI_MODE_SET_CURSOR=true
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VIM="nvim"

# remove user in front of path
DEFAULT_USER=$USER

#--------------------------------------------------------------------------
# Exports
#--------------------------------------------------------------------------

# Decrease delay that vi-mode waits for the end of a key sequence
export KEYTIMEOUT=15

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.config/bin:$PATH"
export BAT_THEME="gruvbox-dark"
export DOTFILES=$HOME/.dotfiles
export XDG_CONFIG_HOME=$HOME/.config
export FZF_DEFAULT_COMMAND='find . \! \( -type d -path ./.git -prune \) \! -type d \! -name '\''*.tags'\'' -printf '\''%P\n'\'
export DOCKER_RSA_KEY="~/.ssh/id_rsa.pub"
export EDITOR=nvim
export VISUAL=nvim


#--------------------------------------------------------------------------
# Aliases
#--------------------------------------------------------------------------

alias finder="nautilus ."
alias testing='git tag -d testing && git push origin :refs/tags/testing && git tag testing'
alias qsdf="setxkbmap real-prog-dvorak"
alias aoeu="setxkbmap fr"
alias lkj="setxkbmap real-prog-dvorak"
alias snth="setxkbmap fr"
alias gbc="git branch | grep -v 'develop' | xargs git branch -D"
alias yarn="corepack yarn"
alias vim="$VIM"
alias gcp_db_dev='cloud-sql-proxy lefigaro-dev:europe-west1:lefigaro-dev-cloudsql-instance-33564d37=tcp:3306'
alias gcp_db_preprod='cloud-sql-proxy lefigaro-preprod:europe-west1:lefigaro-preprod-cloudsql-instance-fb66ee9b=tcp:3306'
alias gcp_db_prod='cloud-sql-proxy lefigaro-prod:europe-west1:lefigaro-prod-cloudsql-instance-55e0095a=tcp:3306'

#alias pr="pull-request.sh"

#--------------------------------------------------------------------------
# Miscellaneous
#--------------------------------------------------------------------------

setopt globdots
bindkey -s ^f "tmux-sessionizer\n"

# Only for linux
# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hfeldstein/work/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/hfeldstein/work/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hfeldstein/work/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/hfeldstein/work/google-cloud-sdk/completion.zsh.inc'; fi

# The next line enables shell command completion for symfony.
if command -v symfony &>/dev/null; then
    eval "$(symfony completion)"
fi
