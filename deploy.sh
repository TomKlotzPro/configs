#! /bin/bash

echo "> Current configuration files for Vim and ZSH will be overriden."
echo "> Press any key to continue or press ^C to abort"
read

git reset --hard HEAD

defaults write com.jetbrains.intellij ApplePressAndHoldEnabled -bool false

# Reinstall Vim Plug
rm -f .vim/autoload/plug.vim
curl -fLo .vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Prepare ZSH (Pure prompt)
rm -rf .zfunctions/pure
git clone git@github.com:sindresorhus/pure.git .zfunctions/pure

# Create relatives links
rm -rf ~/.vim*            && ln -s $PWD/.vim* ~
rm -f ~/.zshrc            && ln -s $PWD/.zshrc ~
rm -f ~/.zfunctions       && ln -s $PWD/.zfunctions ~
ln -s $PWD/pure/pure.zsh  ~/.zfunctions/pure/prompt_pure_setup
ln -s $PWD/pure/async.zsh ~/.zfunctions/pure/async

cd
vim +PlugInstall +qa!

echo
echo "> Configurations updated. Now just run \`source .zshrc\`"
