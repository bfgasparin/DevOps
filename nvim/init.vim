source ~/.config/nvim/plugins.vim

if has('vim_starting')
    set nocompatible               " Be iMproved
endif

"-------------visual-------------"

syntax enable
set encoding=utf8
colorscheme atom-dark-256        " Set the colorscheme

set cursorline                   " Highlight the cursor line

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " makes the cursor a pipe in insert-mode, and a block in normal-mode
"
" enable 24 bit color support if supported
if (has("termguicolors"))
    set termguicolors
endif

" make comments and HTML attributes italic
highlight Comment cterm=italic gui=italic
highlight htmlArg cterm=italic gui=italic
" Quick Note : for italic comments to work on Neovim, I need to update my terminfo
" adding the following line:
"     sitm=\E[3m, ritm=\E[23m,
" Resource : https://github.com/neovim/neovim/issues/3461#issuecomment-268876998

set number                  " show line numbers
" set relativenumber        " show relative line numbers


set wrap                    " turn on line wrapping
set wrapmargin=4            " wrap lines when coming within n characters from side
set linebreak               " set soft wrapping
set showbreak=…             " show ellipsis at breaking
set noerrorbells            " No beeps.
set nojoinspaces            " Prevents inserting two spaces after punctuation on a join (J)

set laststatus=2            " Set statusline to appear all the time (default to appear only when split windows)


" Highlight cursorline unless, but not in insert mode
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

" customize the vertical split line
hi vertsplit ctermfg=234 ctermbg=127 guibg=#A55989 guifg=bg

" customize the Visual and Search mode highlights colors
hi Visual ctermfg=231 ctermbg=97 guifg=fg guibg=#605A79
hi Search ctermfg=231 ctermbg=97 guifg=fg guibg=#605A79
"
" disable foreground for Cursorline
hi Cursorline ctermfg=none guifg=none

"-------------Coding-------------"

set backspace=indent,eol,start    " makes backspace behave like every other editor
set autoindent                    " automatically set indent of new line
set smartindent                   " apply indent according to some smart rules, like inside functions
set smarttab                      " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=8                     " the visible width of tabs
set softtabstop=4                 " tabs width on on insert mode (tab or backspace)
set shiftwidth=4                  " number of spaces to use for indent and unindent on normal mode ( <shift>< or > )
set expandtab                     " insert spaces rather then tabs <Tab>

" auto completions
set completeopt+=longest          " append the longest option to the completeopt. The final stays: menu, preview, longest

" code folding settings
set foldmethod=syntax       " fold based on syntax language file
set foldnestmax=10          " deepest fold is 10 levels
set nofoldenable          " don't fold by default
set foldlevel=1             " close folders with level 2 or greater by default

set cpoptions+=y                  " Add yank command can be redone with "."


"----------------Buffer--------------
set hidden
" nnoremap <leader>d :call functions#DeleteFileAndCloseBuffer() " Its not working

"--------------Splitting--------------
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
set nostartofline       " Do not jump to first character with page commands.


"-------------Searching--------------"
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers

" ignored when expanding wildcards, completing file or
" directory names, and influences the result of expand(), glob() and
" globpath()
" Th itens with */ at the beginning is required by CtrlP wildignore support
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*/.ctagsignore,*/.ignore,*/tags,*/.neovimsession,*/.vim,*/.php_cs.cache,*/.padawan/*,.git/*,.DS_Store,.hg,.svn,.ctagsignore,.ignore,tags,.neovimsession.vim,.php_cs.cache,.padawan/*

"------------Netrw-----------------------"
let g:netrw_hide=1                  " Hide files from g:netrw_list_hide by default


"------------Mapping---------------------"

" set a map leader for more key combos
let mapleader = ','

" Quick write NeoVim session for the project to be restored later
nnoremap <F2> :mksession! .neovimsession.vim <cr>
" Restore NeoVim session for the project
nnoremap <F3> :source .neovimsession.vim <cr>

" shortcut for esc in insert mode
inoremap jj <esc>

" Improved match list command
noremap [I [I:let nr = input("Type the number and \<Enter\>: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Break line in insert mode
nnoremap <CR> i<cr><esc>
" " Restore <CR> mapping in quickfix and location windows
augroup cr_mapping
  autocmd BufReadPost quickfix,location nnoremap <buffer> <CR> <CR>
augroup END

" shortcut to save
nnoremap <leader>s :w<cr>
"
" shortcut to delete buffer
nnoremap <leader>w :bd<cr>

" switch between current and last buffer
nnoremap <leader>. <c-^>

" Quickly go forward or backward to buffer
" Quick note: for <C-h> to work into Iterm, I need adjust my terminal's "kbs" terminfo entry
"     Source : https://github.com/neovim/neovim/wiki/FAQ#my-ctrl-h-mapping-doesnt-work
nnoremap <C-h> :bprevious<cr>
nnoremap <C-l> :bnext<cr>

" Quick access to neovim config file
nnoremap <leader>ev :e! $MYVIMRC <cr>

" Removes simple highlight
nnoremap <Leader><space> :nohlsearch<cr>

" Quickly move current line
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

" Quickly add empty lines
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" Don't lose selection when shifting sidewards
xnoremap <  <gv
xnoremap >  >gv

" shortcut for copy/paste to system clipboard
nnoremap <leader>y "*y
nnoremap <leader>Y "*Y
nnoremap <leader>p "*p
nnoremap <leader>P "*P
xnoremap <leader>y "*y
xnoremap <leader>Y "*Y
xnoremap <leader>p "*p
xnoremap <leader>P "*P


"/
"/ Command line mapping
"/
" Remap input history to the smart arrow keys
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>


"/
"/ Terminal
"/
" remap esc in terminal mode
tnoremap <Esc> <C-\><C-n>


" remap to undo paste command into insert mode. In fact, it undo the changes since last <C-R> command.
" See i_CTRL-G_u
inoremap <C-R> <C-G>u<C-R>


"/
"/ Laravel Specific
"/
" Open specific laravel directories
nnoremap <Leader><Leader>lrw :e routes/web.php<cr>
nnoremap <Leader><Leader>lra :e routes/api.php<cr>
nnoremap <Leader><Leader>lm :e app/Http/Models<cr>
nnoremap <Leader><Leader>lc :e app/Http/Controllers<cr>
nnoremap <Leader><Leader>lp :e app/Providers<cr>
nnoremap <Leader><Leader>lt :e tests/<cr>
nnoremap <Leader><Leader>lcf :e config<cr>
nnoremap <Leader><Leader>ldm :e database/migrations<cr>
nnoremap <Leader><Leader>lds :e database/seeds<cr>
nnoremap <Leader><Leader>ldf :e database/factories/ModelFactory.php<cr>
" Salao VIP
nnoremap <Leader><Leader>ls :e app/Http/Services<cr>
" laravel artisan
nnoremap <Leader><Leader>lmm :!php artisan make:model<space>

"/
"/ Custom macros
"/
" let @<index>=""


"-------------Plugins--------------------"

"/
"/ Vim Cheat40
"/
let g:cheat40_use_default = 0     " disable default cheat40. Uses the cheat at ~/.config/nvim/


"/
"/ NerdTree
"/
" Toogle NerdTree
nnoremap <silent> <c-n>  :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nnoremap <silent> <leader>n :NERDTreeFind<cr>

" Customize Arrow fonts
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'
" Open Netrw instead NERDTree when use :e <dir> command
let NERDTreeHijackNetrw = 0

"/
"/ Tagbar
"/
" Open the Tagbar window, jump to it and close it on tag selection
nnoremap <c-\> :TagbarOpenAutoClose<CR>


"/
"/ GitGutter
"/
let g:gitgutter_map_keys = 0  " Set up Gitgutter to not map any key


"/
"/ Airlines
"/

let g:airline#extensions#tabline#enabled = 1                " Enable tabline
let g:airline#extensions#tabline#fnamemod = ':t'            " Show just the filename
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_powerline_fonts= 1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme='gasparin'

"/
"/ CtrlP
"/
" Open buffer menu
nnoremap <leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>m :CtrlPMRUFiles<CR>

let g:ctrlp_mruf_relative = 1                                 " Show only MRU files in the working directory.

" Configure CtrlP to use Ag (Silver Search)
if executable('ag')
  " Configured ag to use smartcase and ignore VCS ignore files (.gitignore and .hgignore)
  " Note : when using custom command, ctrlP no more consider
  " wildignore and g:ctrlp_custom_ignore variables
  let g:ctrlp_user_command = 'ag -l --nocolor -S -i -U -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_show_hidden = 0                                   " Do not include dotfiles
let g:ctrlp_mruf_exclude = $HOME.'/.config/nvim/*'            " Do not remember config files in mru
let g:ctrlp_open_new_file = 'r'                               " Create new files in the current window
" let g:ctrlp_extensions = ['autoignore']                       " Enable autoignore extension (read .ctrlpignore)
let g:ctrlp_working_path_mode = 'ra'                          " Set up local project as working path.

"                                                               Uses a if r could not found root dir
"                                                                  a - the directory of the current file, unless it is a
"                                                                      subdirectory of the cwd
"                                                                  r - the nearest ancestor of the current file that contains
"                                                                      one of these directories or files:
"                                                                      .git .hg .svn .bzr _darcs



"/
"/ vim-easy-align
"/
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"/
"/ IndentLine
"/
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_color_gui = '#383838'
let g:indentLine_color_term = 237
let g:indentLine_char = '┆'
let g:indentLine_faster = 1


"/
"/ Vim Better Whitespace
"/
" Configure the backgroud color for trailing whitespaces
highlight ExtraWhitespace ctermbg=236 guibg=#282E33
" removes trailing whitespaces when saving buffer
augroup clear_trailing_whitespace
    autocmd!
    autocmd BufEnter * EnableStripWhitespaceOnSave
augroup END

"/
"/ Grepper
"
" Configure tools from grepper. By default grepper will use the first tool of the list
"    ['ag', 'ack', 'grep', 'findstr', 'rg', 'pt', 'sift, 'git']
"    Configured ag to use smartcase. By default, ag uses VCS ignore files (.gitignore and .hgignore)
"    But it still uses .ignore files to ignore files on search
let g:grepper = {
    \ 'next_tool': '<leader>f',
    \ 'ag': {
    \   'grepprg':    'ag --vimgrep -i -S',
    \ }}
let g:grepper.highlight = 1          " Highlight found matches.
let g:grepper.simple_prompt = 1    " Only show the tool name in the prompt, without any of its arguments.
let g:grepper.dir = 'repo,cwd'       " Grep on repository, and current working directory if repo fails

" Shortcuts for Grepper
nnoremap <leader>f :Grepper<cr>
" A map to ignore VCS ignore files (.gitignore, .hgignore) on search
nnoremap <leader>F :Grepper -tool ag -grepprg ag --vimgrep -i -S -U<cr>
nnoremap <leader>% :Grepper -buffer<cr>
nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)


"/
"/ Vim Qf ( Searching / Search and Replate )
"
let g:qf_mapping_ack_style = 1           " Enable Ack.vim-inspired mappings in location/quickfix windows:
" Toggle the quickfix window.
nmap <leader>q <Plug>QfCtoggle
" Toggle the current window's location window
nmap <leader>l <Plug>QfLtoggle

"/
"/ Deoplete (autocomplete)
"/
let g:deoplete#enable_at_startup = 1                 " Enable it at startup
let g:deoplete#enable_smart_case = 1                 " Use smartcase
" @TODO trigger complete with 1 caracter


" Trigger Deoplete with <TAB>
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}


"/
"/ UltiSnips
"/
let g:UltiSnipsExpandTrigger="<c-space>"         " Add key to trigger UltiSnips snippets. Can not use <tab> to not conflict with shortcut for deoplete
let g:UltiSnipsJumpForwardTrigger="<c-space>"    " Map forward jump trigger for ultisnips jumps


"/
"/ pdv PHP Documenter VIM
"/
let g:pdv_template_dir = $HOME ."/.config/nvim/plugins/pdv/templates_snip"    " The path to the pdv templates
" Shortcut to add php docblocks
augroup php_docblocks
    autocmd!
    autocmd FileType php nnoremap <buffer> <leader>d :call pdv#DocumentWithSnip()<CR>
augroup END

"/
"/ Vim PHP Namespace
"/
let g:php_namespace_sort_after_insert = 1                " Sort dependencies every time one is inserted
"
" Insert use statement at the top of the file
"     new Response<-- cursor here or on the name; hit <leader>u now to insert the use statement
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
" Expand the fully qualified classe name
"     new Response<-- cursor here or on the name; hit <leader>ec now to insert the use statement
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction

" Created shortcuts for php namespace only on php files
augroup php_namespace
    autocmd!
    autocmd FileType php inoremap <buffer> <Leader>uu <Esc>:call IPhpInsertUse()<CR>
    autocmd FileType php noremap <buffer> <Leader>uu :call PhpInsertUse()<CR>
    autocmd FileType php inoremap <buffer> <Leader>ec <Esc>:call IPhpExpandClass()<CR>
    autocmd FileType php noremap <buffer> <Leader>ec :call PhpExpandClass()<CR>
    " Sort php use statements
    autocmd FileType php inoremap <buffer> <Leader>us <Esc>:call PhpSortUse()<CR>
    autocmd FileType php noremap <buffer> <Leader>us :call PhpSortUse()<CR>
augroup END



"/
"/ Deoplete Padawan
"/
" Register custom neovim commands to start Padawan server
" command! PadawanStart call deoplete#sources#padawan#StartServer()
" command! PadawanStop call deoplete#sources#padawan#StopServer()
" command! PadawanRestart call deoplete#sources#padawan#RestartServer()

" Note : (php igbinary extenion was installed for better padawan
"performance)
" Note 2: Plugin was commented, because there is some bugs at the time I wrote this:
"      https://github.com/padawan-php/padawan.php/issues/71#issuecomment-26402568


"/
"/ Vim PHP CS Fixer
"/
let g:php_cs_fixer_rules = "@PSR2"        " set PSR2 rules to be used on cs fixer
let g:php_cs_fixer_default_mapping = 0    " Disable the default mapping (<leader>pcd)
" Shortcuts to apply php-cs-fixer, and after update lint with Neomake
augroup php_mappings
    autocmd!
    autocmd FileType php nnoremap <buffer> <silent> <F8> :call PhpCsFixerFixDirectory()<CR> :Neomake<CR>
    autocmd FileType php nnoremap <buffer> <silent> <F9> :call PhpCsFixerFixFile()<CR> :Neomake<CR>
augroup END

"/
"/ Neomake (assyn lint framework)
"/
" let g:neomake_open_list = 2       " open the location windows with the lin errors without move the cursor
let g:neomake_php_phpmd_maker = {
    \ 'args': ['%:p', 'text', 'phpmd-rulesets.xml'],
    \ 'errorformat': '%E%f:%l%\s%m'
    \ }
"
" Run Neomake on the current file on every write:
augroup neomake_lints
    autocmd!
    autocmd BufWritePost * Neomake
augroup END

" Note : For PHP, Neomake, by default, will run php -l, phpcs and phpmd, if available.
let g:neomake_php_phpcs_args_standard="PSR2"        " set PSR2 rules to be used by phpcs when new make runs.

"/
"/ Vim Test
"/
let test#strategy = "neovim"                      " Runs test commands with :terminal
nnoremap <silent> <leader>tf :TestNearest<CR>
nnoremap <silent> <leader>t% :TestFile<CR>
nnoremap <silent> <leader>ta :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tg :TestVisit<CR>



"-------------Auto-Commands--------------"

" Automatically source the Neovim config file on save.
augroup autosourcing
    autocmd!
    autocmd BufWritePost init.vim  source %
augroup END

" Regerate all ctags, asynchronously, when every buffer is saved
augroup ctags_management
    autocmd!
    autocmd BufWritePost * call jobstart("ctags-update.sh")
augroup END
"-------------Ctags----------------------"

set tags+=tags       " set the ctag files


" ---------Notes and Tips---------------"

" Type <leader>? to open a cheat sheet menu
"
" @todo migrate remaining commands to cheat40 plugin.


"/
"/ NERDTree
"/
" Press <leader>n to search the current file in NERDTree (custom shortcut)
" Press <c-n> to toogle NERDTree (custom shortcut)
"     Press o to open or close a node. If file, opens the file into current buffer
"     Press s to open vertical split
"     Press i to open split
"     Press t to open in new tab
"     Press q to close NerdTree windows
"     Press a to toggle zoom NerdTree windows
"     Press m to open a helpful menu with some helper methods, <ESC> to exit menu
"     Press I to toggle hidden file


"/
"/ Fugitive (Git)
"/
" Use :Git <command git> to execute raw git command
" Use :GStatus to open a git status windows
"    Press - to staged or unstage a given file (works on visual mode)
"    Press d to see the cursor file diff into an horizontal split (same as :Gdiff)
"    Press dv to see the cursor file diff into a vertical split (same as :Gvdiff)
"    Press cc to commit the cursor file
"    Press U to checkout the cursor file
" Use :Gwrite to put the content to the other buffer (index / local) -- needs to save file to apply
" Use :Gread to put the content to the other buffer (index / local) --needs to save file to apply
" Use :Gvdiff to see the current file diff into a vertical split
"    Use :diffget to get a partial content of the other buffer (index / local) - needs to save file to apply changes
"        or just press do (does not work on VISUAL mode)
"    Use :diffput to put a partial content on the other buffer (index / local) - needs to save file to apply changes
"        or just press dp (does not work on VISUAL mode)
"    Use :diffupdate  to forcei the diferences to be updated on the screen (complicated changes are not updated automatically)
" Use :Git add % to stage the current file to the index (equivalent to :Gwrite, but does not update the buffer)
" Use :Git checkout % to revert current file to last checked in version (equivalent to :Gread, but does not update the buffer)
" Use :Git rm %	to delete the current file (equivalent to :Gremove, but does not update the buffer)
" Use :Git mv % <source> to rename the current file (equivalent to :Gmove, but does not update the buffer)

"/
"/ Grepper (Searching)
"/
" Press <leader>f to execute :Grepper and enter in prompt to find for an expression
"    Type <c-c> to cancel and exit prompt
"    Type <c-p> <c-n> to go back and forward search expression history
"    Type <tab> to switch to next grepper search tool (see g:grepper.tools)
"    Type <c-f> to open |cmdline-window|. Use <c-c> to quit
" Press <leader>* to search for the word in cursor without prompt
" Press <leader>% to execute :Grepper -buffer and enter in prompt to find for an expression in the current buffer
" Press <leader>F to make grepper ignores VCS ignore files
" Press gs<motion> to search for the result of the motion
"      gsi(
" For search on command mode, use:
"     :Grepper <flags>
" Or the custom commands:
"     :Grepper-query something
"


"/
"/ Vim Qf ( Searching / Search and Replate )
"/
" Type <leader>q to toggle quickfix window
" Type <leader>l to toggle location window
" In quickfix/location windows, type:
"    s - open entry in a new horizontal window
"    v - open entry in a new vertical window
"    t - open entry in a new tab
"    o - open entry and come back
"    O - open entry and close the location/quickfix window
"    p - open entry in a preview window
"
"    Search and Replate:
"
"    :Keep       to keep only entries that containing the given argument (filename or in the description).
"                Argument is not a regular expression pattern.
"    :Reject     to reject all entries that containing the given argument (filename or in the description).
"                Argument is not a regular expression pattern.
"    :Restore    Restore the list to its original state
"    :Doline    Execute an Ex command on every line in the current list.
"                Aliased to the built-in `:cdo` and `:ldo` when applicable.
"                Note : with subtitute command, do not use g flag or % range (for
"                all file) because the search list already has a item on list
"                for ocurrences on a file). If you use % or g, subistitution
"                will fail on next list item executions because will not find
"                the pattern, already changed by last command.
"                    :Doline s/foo/bar
"   :Doline     Execute an Ex command on every file in the current list.
"                Aliased to the built-in `:cfdo` and `:lfdo` when applicable.
"                Note :with subistitution command, note that the command will
"                execute only once per file, so you must consider use % range
"                or g flag to apply to all ocurrences.
"                    :Dofile %s/foo/bar/g
"                    :Dofile norm @q
"    Hints :
"        :Reject <c-r><c-w> to reject all ocurrences containing  the <cword> (word under the cursor)
"        :Reject <c-r><c-a> with the cursor under the file path to reject the current item on quicklist
"        :Keep <c-r><c-f> with the cursor under the file path to keep all ocurrences the file
"
" Note : Vim-Qf quit NeoVim if the last window is a location/quickfix window


"/
"/ Deoplete (auto complete)
"/
" Press <TAB> to navigate through popup options
" or <C-n> and <C-p> to go foward and backward through popup options
" Press <C-h> to close popup and delete backword char

"/
"/ UltiSnips ( integrated to Deoplete )
"/
" On Deoplete pop, select the snippet and type <c-space> to trigger
" or just type the snippet name and type <c-space>
"   type <c-space> again to go forward snippets jumps
"   type <c-k> to go backward snippts jumpts
" Type :UltiSnipsEdit to open the snippets file for the current filetype

" --------- Helpers ---------------"

"/
"/ Cheat sheet
"/
" ~/.config/nvim/cheat40.txt


"/
"/ Helper scripts
"/
" ~/bin/ctags-update.sh
" phpmd-rulesets.xml
" .ctagsignore
" .ignore


"/
"/ External libs
"/
" - universal-ctags (for tagging files) - uses .ctagsignore to ignore files
" - ryanoasis/nerd-fonts for fonts with devicons
" - ggreer/the_silver_searcher (ag for code searching) - uses .ignore to ignore files
