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

## global git ignore
    ```bash
    git config --global core.excludesfile ~/.gitignore
    ```
