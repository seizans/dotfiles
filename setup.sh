cd ~

brew install neovim/neovim/neovim
mkdir .vim
mkdir .config
ln -sv .vim .config/nvim
mkdir -p ~/.vim/dein
mkdir -p ~/.vim/colors

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.config/nvim/dein

ln -snvf dotfiles/nvimrc .vimrc
ln -snvf dotfiles/dein.toml .dein.toml
ln -svnf dotfiles/dein_lazy.toml .dein_lazy.toml

git config --global include.path ~/dotfiles/gitconfig
