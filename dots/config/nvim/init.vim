"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/


" BASE
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/vim-plug/plugins.vim

" Themes
source $HOME/.config/nvim/themes/forest.vim
source $HOME/.config/nvim/themes/lightline.vim
source $HOME/.config/nvim/themes/highlightyank.vim

" Plugins
source $HOME/.config/nvim/plug-config/ale.vim
source $HOME/.config/nvim/plug-config/betterwhitespace.vim
source $HOME/.config/nvim/plug-config/blamer.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/gitgutter.vim
source $HOME/.config/nvim/plug-config/goyo.vim
source $HOME/.config/nvim/plug-config/gutentags.vim
source $HOME/.config/nvim/plug-config/identline.vim
source $HOME/.config/nvim/plug-config/nerdcommenter.vim
source $HOME/.config/nvim/plug-config/simplyfold.vim
source $HOME/.config/nvim/plug-config/ultisnippets.vim
source $HOME/.config/nvim/plug-config/undotree.vim
source $HOME/.config/nvim/plug-config/vista.vim
source $HOME/.config/nvim/plug-config/webdevicons.vim

if !empty(glob("./paths.vim"))
  source $HOME/.config/nvim/paths.vim
endif
let g:polyglot_disabled = ['csv']
