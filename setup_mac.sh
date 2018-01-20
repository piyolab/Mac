#!/bin/sh

echo "Create ~/.bash_profile"
touch $HOME/.bash_profile


echo "========================================"
echo "Instsall homebrew."
echo "========================================"
if [ -d $HOME/.homebrew ]; then
	echo "~/.homebrew already exists."
	echo "Skip instsalling homebrew."
else
	mkdir $HOME/.homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOME/.homebrew
	echo 'export PATH=$HOME/.homebrew/bin:$PATH' >> $HOME/.bash_profile
	echo 'export HOMEBREW_CACHE=$HOME/.homebrew/cache' >> $HOME/.bash_profile
	source ~/.bash_profile
	echo "Completed instsalling homebrew!"
fi
brew --prefix | brew --version


echo "========================================"
echo "Instsall node."
echo "========================================"
tmp=$(brew list | grep -w node)
if [ $tmp = "node" ]; then
	echo "node has already been installed."
	echo "Skip instsalling node."
else
	brew install node
	echo "Completed instsalling node!"
fi
node --version


echo "========================================"
echo "Instsall ethereum."
echo "========================================"
tmp=$(brew list | grep -w ethereum)
if [ $tmp = "ethereum" ]; then
	echo "ethereum has already been installed."
	echo "Skip instsalling ethereum."
else
	brew tap ethereum/ethereum
	brew install ethereum
	echo "Completed instsalling ethereum!"
fi
geth version










