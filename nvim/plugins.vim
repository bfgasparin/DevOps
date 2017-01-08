call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'gosukiwi/vim-atom-dark'           " colorscheme


"visual
Plug 'vim-airline/vim-airline'        " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'Yggdroot/indentLine'            " Display the indention levels with thin vertical lines


" utilities
Plug 'junegunn/vim-easy-align'                                " mappings for aligment content
Plug 'tpope/vim-surround'                                     " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-fugitive'                                     " awesome Git wrapper
Plug 'tpope/vim-commentary'                                   " comment stuff out
Plug 'tpope/vim-abolish'                                      " easily search for, substitute, and abbreviate multiple variants of a word (snakeCase, camelCase, ...)
Plug 'mileszs/ack.vim'                                        " code Searching tool
Plug 'skwp/greplace.vim'                                      " search and Replace plugin
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete feature
" @todo Configure padawan-php to work without bug https://github.com/padawan-php/padawan.php/issues/71#issuecomment-270927679 
" Plug 'padawan-php/deoplete-padawan'                         " asynchronous completion of PHP code using padawan project

" PHP
Plug 'StanAngeloff/php.vim'                                   " A PHP 5.6 syntax file
Plug 'arnaud-lb/vim-php-namespace'                            " add use statement and expand fully qualified php classes
Plug 'stephpy/vim-php-cs-fixer'                               " Integrates php-cs-fixer

" Languages (General)
Plug 'janko-m/vim-test'                                       " Add support for running tests easily and fast
Plug 'SirVer/ultisnips'                                       " Add snippet support 
Plug 'tobyS/vmustache'                                        " Template system engine (required by tobyS/pdv)
Plug 'tobyS/pdv'                                              " to generate PHP docblock

" navigation
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder
Plug 'tpope/vim-vinegar' " alternative and minimalist file finder
Plug 'majutsushi/tagbar' " show current file ctags in a diferent view
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer

call plug#end()
