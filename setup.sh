#!/usr/bin/env zsh

if [[ "$OSTYPE" == "darwin"* ]]; then
	# HOME BREW SETUP
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew bundle
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
	sudo apt install nvim htop fzf tmux
fi

# SETUP NVIM
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall +qa

# TMUX SETUP
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
