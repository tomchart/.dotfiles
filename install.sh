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

    echo "Installing language servers..."
    npm i -g pyright
    npm i -g bash-language-server
    npm i -g remark
    npm i -g remark-language-server

fi

if linux; then
    pkgs='zsh tmux neovim git build-essential cargo'
    for pkg in $pkgs; do
        echo "Installing $pkg..."
        sudo apt install $pkg
    done

    cargo_pkgs="exa fd-find ripgrep stylua"
    for pkg in $pkgs; do
        echo "Installing $pkg..."
        cargo install $pkg
    done

    echo "Installing nvm and node ${node_version}..."
    if curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash && nvm install $node_version; then
        echo "Installing language servers..."
        npm i -g pyright
        npm i -g bash-language-server

    echo "Installing fzf..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

    echo "Installing nvim..."
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install neovim

fi

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended 

echo "Installing Oh My Zsh plugins: fast-syntax-highlighting, zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing Oh My Zsh dracula theme..."
git clone https://github.com/dracula/zsh.git ${ZSH}/themes/dracula
ln -isv ${ZSH}/themes/dracula/dracula.zsh-theme ${ZSH}/themes/dracula.zsh-theme

echo "Installing tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Making symlinks..."
ln -isv ~/dotfiles/.cmtm.sh ~
ln -isv ~/dotfiles/.gitconfig ~
ln -isv ~/dotfiles/.tmux.conf ~
ln -isv ~/dotfiles/.zshrc ~
ln -isv ~/dotfiles/custom-mappings.zsh ${ZSH_CUSTOM}
mkdir -pv ~/.config/nvim && ln -isv ~/dotfiles/init.lua ~/.config/nvim && ln -isv ~/dotfiles/lua ~/.config/nvim

echo "Changing login shell..."
chsh -s $(which zsh)

echo "Done. Starting zsh..."
exec zsh
