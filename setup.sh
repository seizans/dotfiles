cd ~

brew install neovim/neovim/neovim
mkdir .vim
mkdir .config
ln -sv .config/nvim .vim
mkdir -p ~/.vim/dein
mkdir -p ~/.vim/colors

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.config/nvim/dein

ln -snvf dotfiles/nvimrc .vimrc
ln -snvf dotfiles/dein.toml .dein.toml

git config --global include.path ~/dotfiles/gitconfig
