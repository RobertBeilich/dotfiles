bindkey -v

export COMPLETION_WAITING_DOTS="true"
setopt correct
unsetopt correctall
setopt autocd
unsetopt beep
setopt pushd_ignore_dups
setopt notify
setopt nomatch
setopt extendedglob

export VISUAL=vim
export EDITOR="$VISUAL"

export DEFAULT_USER=sebaran
export ZSH_CUSTOM=$HOME/.config/zsh
export ZSH_THEME=mod_agnoster

# History
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt share_history
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
HIST_IGNORE="(ls|cd|cd -|..*|pwd|exit|clear|date|* --help|vim|tmux)"

zstyle :compinstall filename '/home/sebaran/.zshrc'
autoload -Uz compinit
compinit

if [ ! -d ${HOME}/.zgen ]; then
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi

source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/archlinux
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load StackExchange/blackbox
  zgen load chrissicool/zsh-256color
  zgen load supercrabtree/k

  zgen save
fi

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.config/composer/vendor/bin
export PATH=$PATH:$HOME/.yarn/bin

for plugin in ~/.config/zsh/plugins/*.zsh; do
  source $plugin
done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

silent(){ 2>/dev/null 1>&2 $* }
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
