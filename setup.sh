cd ~

brew tap neovim/neovim
brew install neovim

mkdir -p ~/.config/nvim/dein
mkdir -p ~/.config/nvim/colors

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein

ln -snvf ~/dotfiles/nvimrc .config/nvim/init.vim
ln -snvf ~/dotfiles/dein.toml .config/nvim/dein.toml

git config --global include.path ~/dotfiles/gitconfig
