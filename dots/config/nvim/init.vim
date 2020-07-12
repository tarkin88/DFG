"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/
" by tarkin88

" BASE
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/searching.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/plugins.vim

" Themes
source $HOME/.config/nvim/themes/srcery.vim
" source $HOME/.config/nvim/themes/sonokai.vim
source $HOME/.config/nvim/themes/lightline.vim
source $HOME/.config/nvim/themes/highlightyank.vim

" configs
source $HOME/.config/nvim/configs/ale.vim
source $HOME/.config/nvim/configs/blamer.vim
source $HOME/.config/nvim/configs/bookmarks.vim
source $HOME/.config/nvim/configs/carbon.vim
source $HOME/.config/nvim/configs/coc.vim
source $HOME/.config/nvim/configs/commentary.vim
source $HOME/.config/nvim/configs/doge.vim
source $HOME/.config/nvim/configs/fzf.vim
source $HOME/.config/nvim/configs/nerdtree.vim
source $HOME/.config/nvim/configs/gitgutter.vim
source $HOME/.config/nvim/configs/gutentags.vim
source $HOME/.config/nvim/configs/rainbow.vim
source $HOME/.config/nvim/configs/rooter.vim
source $HOME/.config/nvim/configs/ultisnippets.vim
source $HOME/.config/nvim/configs/undotree.vim


if !empty(glob("./paths.vim"))
  source $HOME/.config/nvim/paths.vim
endif
let g:polyglot_disabled = ['csv']

