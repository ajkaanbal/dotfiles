# dotfiles


## MC


MC skin requires:

1. Edit ``` ~/.config/mc/ini ```
Search skin= and replace by
    skin=ajkaanbal

2. After ``` dotfiles --sync ``` create symbolic link to .ajkaanbal_mc_skin.inii
    
    ```bash
    $ ln -s ~/.ajkaanbal_mc_skin.ini
    ~/.local/share/mc/skins/ajkaanbal.ini
    ```

3. Done.


## Vim Plugins

Most of plugins are git submodules. 

### Fuzzyfinder

For use fuzzyfinder just clone it from bitbucket repository into vim/bundle

```bash
$ cd ~/.vim/bundle
$ hg clone https://bitbucket.org/ns9tks/vim-l9
$ hg clone https://bitbucket.org/ns9tks/vim-fuzzyfinder```
