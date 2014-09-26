# dotfiles

## MC


MC skin requires:

1. Edit ``` ~/.config/mc/ini ```
Search skin= and replace by
    skin=ajkaanbal

2. After ``` dotfiles --sync ``` create symbolic link to .ajkaanbal_mc_skin.ini
    
    ```bash
    $ ln -s ~/.ajkaanbal_mc_skin.ini ~/.local/share/mc/skins/ajkaanbal.ini
    ```
3. Symbolic link to openbox
    ```bash
    $ln -s ~/.openbox ~/.config/openbox

4. Tmux plugin Manager

  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## global git ignore
    ```bash
    git config --global core.excludesfile ~/.gitignore
    git config --global alias.trash '!mkdir -p .trash && git ls-files --others --exclude-standard | xargs mv -f -t .trash'
    ```
