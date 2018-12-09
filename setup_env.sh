#! usr/bin/env bash
# for ubuntu
#sudo add-apt-repository -y ppa:deadsnakes/ppa
#sudo apt-get update -yq
#sudo apt-get install -yq software-properties-common realpath python3.6 python3-pip xclip
#pip3 install virtualenv
#sudo apt-get install python3-venv
#git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# for arch
#sudo pacman -Syu python #installs latest python by default
#sudo pacman -Syu python-pip #installs pip for python3 by default
#sudo pacman -Syu vim-jedi #installs vim-jedi for vundle

cp .vimrc ~/.vimrc

cd $HOME
vim +BundleInstall +qall
#add bin to path
mkdir -p $HOME/bin
echo "PATH='$PATH:$HOME/bin" >> ~/.bashrc

#addtobin $HOME/bin
#echo "copy this into your github ssh keys to enable ssh "
#ssh-keygen -t rsa -f ~/.ssh/github
#cat ~/.ssh/github.pub
