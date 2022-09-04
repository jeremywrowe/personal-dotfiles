### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \
    spaceship-prompt/spaceship-prompt

### End of Zinit's installer chunk
. $(brew --prefix asdf)/libexec/asdf.sh

### ALIASES
alias config='/usr/bin/git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME'
alias cloud="cd '$HOME/Library/Mobile Documents/com~apple~CloudDocs/'"
alias reload="exec $SHELL"

### FUNCTIONS

function setup-config() {
	git clone --bare https://github.com/jeremywrowe/dotfiles $HOME/.cfg
	config config --local status.showUntrackedFiles no
	config checkout
}

p () {
  local directory="$(tree ~/src/github.com/* -L 1 -d -f -i | fzf)"
  if [[ $directory ]]; then
    cd $directory
  fi
}

### ZSH SETUP

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob
unsetopt beep


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
