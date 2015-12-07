#!/bin/bash

dnf install openbox rxvt-unicode-256color-ml xsel gmrun xlockmore nitrogen tmux htop dnf-plugins-core gcc python-devel redhat-rpm-config zsh rvm cmake boost llvm gcc-c++ wmctrl tig
dnf -y copr enable dperson/neovim dnf -y install neovim
pip install dotfiles neovim virtualenvwrapper

git clone git@github.com:ajkaanbal/dotfiles.git Dotfiles
cd Dotfiles
git submodule --init --recursive
cd ~
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone git://github.com/tarruda/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
ln -s ~/.ajkaanbal.zsh-theme ~/.oh-my-zsh/themes/
chsh -s /bin/zsh
ln -s ~/.openbox ~/.config/openbox

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s ~/.nvimrc ~/.config/nvim/init.vim

# Download oracle jdk

alternatives --install /usr/bin/java java /usr/java/latest/jre/bin/java 200000
alternatives --install /usr/bin/javaws javaws /usr/java/latest/jre/bin/javaws 200000
alternatives --install /usr/lib64/mozilla/plugins/libjavaplugin.so libjavaplugin.so.x86_64 /usr/java/latest/jre/lib/amd64/libnpjp2.so 200000
alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000
alternatives --install /usr/bin/jar jar /usr/java/latest/bin/jar 20000
alternatives --install /usr/bin/jar jar /usr/java/latest/bin/jar 200000

