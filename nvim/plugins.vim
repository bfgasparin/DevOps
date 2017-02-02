call plug#begin('~/.config/nvim/plugged')

 " colorschemes
 Plug 'gosukiwi/vim-atom-dark'           " colorscheme


 "visual
 Plug 'vim-airline/vim-airline'        " fancy statusline
 Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
 Plug 'Yggdroot/indentLine'            " Display the indention levels with thin vertical lines
 Plug 'ntpeters/vim-better-whitespace' " Highlight trailing whitespaces and enable commands to fix it
 Plug 'airblade/vim-gitgutter'         " Shows a git diff in the 'gutter'

" " utilities
 Plug 'junegunn/vim-easy-align'                                " mappings for aligment content
 Plug 'tpope/vim-surround'                                     " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
 Plug 'tpope/vim-fugitive'                                     " awesome Git wrapper
 Plug 'tpope/vim-commentary'                                   " comment stuff out
 Plug 'tpope/vim-abolish'                                      " easily search for, substitute, and abbreviate multiple variants of a word (snakeCase, camelCase, ...)
 Plug 'mhinz/vim-grepper'                                      " code Searching/Search and Replace  tool (With Neovim Async support)
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete feature
 " @todo Configure padawan-php to work without bug https://github.com/padawan-php/padawan.php/issues/71#issuecomment-270927679
 " Plug 'padawan-php/deoplete-padawan'                         " asynchronous completion of PHP code using padawan project
 Plug 'danro/rename.vim'                                     " Rename a file on buffer and disk retaining the relative path
 Plug 'tpope/vim-repeat'                                       " Enable repeating plugin maps with .
" " PHP
 Plug 'StanAngeloff/php.vim'                                   " A PHP 5.6 syntax file
 Plug 'arnaud-lb/vim-php-namespace'                            " add use statement and expand fully qualified php classes
 Plug 'stephpy/vim-php-cs-fixer'                               " Integrates php-cs-fixer

 " Languages (General)
 Plug 'janko-m/vim-test'                                       " Add support for running tests easily and fast
 Plug 'SirVer/ultisnips'                                       " Add snippet support
 Plug 'tobyS/vmustache'                                        " Template system engine (required by tobyS/pdv)
 Plug 'tobyS/pdv'                                              " to generate PHP docblock
 Plug 'neomake/neomake'                                        " Add lint support using async Neovim job control

 " navigation
 Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder
 Plug 'tpope/vim-vinegar' " alternative and minimalist file finder
 Plug 'majutsushi/tagbar' " show current file ctags in a diferent view
 Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
Plug 'romainl/vim-qf'   " Collections of settings, commands and mappings to easily work with quickfix/location windows

" helper
 Plug 'lifepillar/vim-cheat40'
call plug#end()
