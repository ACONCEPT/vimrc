#! usr/bin/env bash
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update -yq
sudo apt-get install -yq software-properties-common realpath python3.6 python3-pip xclip
#pip3 install virtualenv
sudo apt-get install python3-venv
pip3 install --update pip
ssh-keygen -t rsa -f ~/.ssh/github
#add bin to path
if [ -d "$HOME/bin" ] ; then
	PATH="$PATH:$HOME/bin"
fi
#addtobin $HOME/bin
echo "copy this into your github ssh keys to enable ssh "
cat ~/.ssh/github.pub
