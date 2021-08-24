#!/bin/bash
errors_path=~/dotfiles/errors

echo "Making symlinks..."
ln -s ~/dotfiles/.* ~



echo "Installing zsh, tmux, neovim..."
pkgs='zsh tmux neovim'
for pkg in $pkgs; do
    sudo apt install -y $pkg 2> >(tee $errors_path)
done

echo "Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install 2> >(tee $errors_path)


echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended 2> >(tee $errors_path)

echo "Installing Oh My Zsh plugins: fast-syntax-highlighting, zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 2> >(tee $errors_path)
git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting 2> >(tee $errors_path)

echo "Changing login shell..."
chsh -s $(which zsh) 2> >(tee $errors_path)

echo "Done. Starting zsh..."
exec zsh
