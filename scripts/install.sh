#!/bin/bash

# set config vars
node_version='v12.22.8'

# write helper funcs
osx() {
    [ $(uname) = "Darwin" ]
}

linux() {
    [ $(uname) = "Linux" ]
}

echo "Hi!"

if osx; then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    pkgs="zsh git tmux fzf fd bat ripgrep nvim node"
    for pkg in $pkgs; do
        echo "Installing $pkg..."
        brew install $pkg
    done

    echo "Setting up fzf..."
    $(brew --prefix)/opt/fzf/install
fi

if linux; then
    pkgs='zsh tmux git build-essential cargo'
    for pkg in $pkgs; do
        echo "Installing $pkg..."
        sudo apt install $pkg
    done

    cargo_pkgs="exa fd-find ripgrep stylua tree-sitter-cli"
    for pkg in $pkgs; do
        echo "Installing $pkg..."
        cargo install $pkg
    done

    echo "Installing fzf..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

fi

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended 

echo "Installing Oh My Zsh plugins: fast-syntax-highlighting, zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing Oh My Zsh dracula & gruvbox theme..."
git clone https://github.com/dracula/zsh.git ${ZSH}/themes/dracula
ln -isv ${ZSH}/themes/dracula/dracula.zsh-theme ${ZSH}/themes/dracula.zsh-theme
curl -L https://raw.githubusercontent.com/sbugzu/gruvbox-zsh/master/gruvbox.zsh-theme > ~/.oh-my-zsh/custom/themes/gruvbox.zsh-theme

echo "Installing tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Making symlinks..."
ln -isv ~/dotfiles/custom-mappings.zsh ${ZSH_CUSTOM}

echo "Changing login shell..."
chsh -s $(which zsh)

echo "Done. Starting zsh..."
exec zsh
