cd ~

mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

echo 'source $HOME/dotfiles/vimrc' > ~/.vimrc

git config --global include.path ~/dotfiles/gitconfig
