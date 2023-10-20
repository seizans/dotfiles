cd ~

brew tap neovim/neovim
brew install neovim

mkdir -p ~/.config/nvim/dein
mkdir -p ~/.config/nvim/colors

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh)"
sh ./installer.sh ~/.cache/dein

ln -snvf ~/dotfiles/nvimrc .config/nvim/init.vim
ln -snvf ~/dotfiles/dein.toml .config/nvim/dein.toml

git config --global include.path ~/dotfiles/gitconfig
