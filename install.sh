#!/bin/bash

dnf install openbox rxvt-unicode-256color-ml xsel gmrun xlockmore nitrogen tmux htop dnf-plugins-core gcc python-devel redhat-rpm-config zsh rvm cmake boost llvm gcc-c++ wmctrl tig the_silver_searcher tig caja numlockx cowsay meld dunst acpi pass feh
dnf install ncurses-devel libX11-devel gpm-devel gtk2-devel libSM-devel libXpm-devel libXt-devel libacl-devel lua-devel dmenu weechat slock w3m w3m-img xautolock pyxtrlock compton

#codecs after enable rpm fusion
dnf install gstreamer-plugins-bad gstreamer-plugins-bad-free-extras gstreamer-plugins-bad-nonfree gstreamer-plugins-ugly gstreamer-ffmpeg most
dnf install gstreamer1-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer1-plugins-base-tools gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-good gstreamer1-plugins-base gstreamer1


dnf copr enable carlwgeorge/ripgrep
dnf install ripgrep
dnf -y copr enable dperson/neovim dnf -y install neovim
pip install dotfiles neovim virtualenvwrapper  websocket-client

git clone git@github.com:ajkaanbal/dotfiles.git Dotfiles
cd Dotfiles
git submodule update --init --recursive
cd ~
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh git clone git://github.com/tarruda/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
cd ~/.oh-my-zsh/plugins
git clone https://github.com/Tarrasch/zsh-autoenv
mv zsh-autoenv/autoenv.plugin.zsh zsh-autoenv/zsh-autoenv.plugin.zsh
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

Kvm
===

Enable kvm virt acceleration for Android Virtual Device emulator

Open Terminal window and type:
  - su -c "dnf install @virtualization"
  - su -c "systemctl start libvirtd"
  
Verify that the kvm kernel modules were properly loaded
  - lsmod | grep kvm
  If you see kvm_amd or kvm_intel, you're on the way!
  
Troubleshooting
===============
Recommended other packages:
  - sudo dnf install virt-manager libvirt libvirt-python python-virtinst

If you have another issues, try:
  - sudo modprobe kvm
  - sudo modprobe kvm_intel
  - sudo modprobe kvm_amd
in base of your processor.
