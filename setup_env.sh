#! usr/bin/env bash
# for ubuntu
#sudo add-apt-repository -y ppa:deadsnakes/ppa
#sudo apt-get update -yq
#sudo apt-get install -yq software-properties-common realpath python3.6 python3-pip xclip
#pip3 install virtualenv
#sudo apt-get install python3-venv

# for arch
#sudo pacman -Syu python #installs latest python by default
#sudo pacman -Syu python-pip #installs pip for python3 by default
#sudo pacman -Syu vim-jedi #installs vim-jedi for vundle

cd $HOME
vim +BundleInstall +qall
ssh-keygen -t rsa -f ~/.ssh/github
#add bin to path
mkdir -p $HOME/bin
if [ -d "$HOME/bin" ] ; then
	PATH="$PATH:$HOME/bin"
fi
#addtobin $HOME/bin
echo "copy this into your github ssh keys to enable ssh "
cat ~/.ssh/github.pub
