source ~/.config/nvim/plugins.vim

if has('vim_starting')
    set nocompatible               " Be iMproved
endif

set clipboard=unnamed           " set the clipboard as the same as OS


"-------------Visual-------------"

syntax enable
set encoding=utf8
set t_Co=256                     " Explicitly tell vim that the terminal supports 256 colors"
colorscheme atom-dark-256        " Set the colorscheme

" make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermbg=none ctermfg=8
highlight NonText ctermbg=none ctermfg=8

" make comments and HTML attributes italic
highlight Comment cterm=italic
highlight htmlArg cterm=italic
set number                  " show line numbers
" set relativenumber        " show relative line numbers

" customize the vertical split line
hi vertsplit ctermfg=232 ctermbg=192
set wrap                    " turn on line wrapping
set wrapmargin=4            " wrap lines when coming within n characters from side
set linebreak               " set soft wrapping
set showbreak=…             " show ellipsis at breaking
set noerrorbells            " No beeps.
set nojoinspaces            " Prevents inserting two spaces after punctuation on a join (J)

set laststatus=2            " Set statusline to appear all the time (default to appear only when split windows)


"-------------Coding-------------"

set backspace=indent,eol,start    " makes backspace behave like every other editor
set autoindent                    " automatically set indent of new line
set smartindent                   " apply indent according to some smart rules, like inside functions
set smarttab                      " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=8                     " the visible width of tabs
set softtabstop=4                 " tabs width on on insert mode (tab or backspace)
set shiftwidth=4                  " number of spaces to use for indent and unindent on normal mode ( <shift>< or > )
set expandtab                   " insert spaces rather then tabs <Tab>

" auto completions
set completeopt+=longest          " append the longest option to the completeopt. The final stays: menu, preview, longest

" code folding settings
set foldmethod=syntax       " fold based on indent
set foldnestmax=10          " deepest fold is 10 levels
set nofoldenable            " don't fold by default
set foldlevel=1

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

"------------Mapping---------------------"

" set a map leader for more key combos
let mapleader = ','

" Quick write Vim session for the project to be restored later
map <F2> :mksession! .vimsession.vim <cr> 
" Restore Vim session for the project 
map <F3> :source .vimsession.vim <cr> 

" remap esc
imap jj <esc>

" shortcut to save
nmap <leader>s :w<cr>
"
" shortcut to delete buffer
nmap <leader>w :bd<cr>

" switch between current and last buffer
nmap <leader>. <c-^>

" Quickly go forward or backward to buffer
" Quick note: for <C-h> to work into Iterm, I need to remap the <C-h> into Iterm, that was mapped to <BS> 
"     Source : https://github.com/neovim/neovim/issues/2048#issuecomment-98307896
nmap <C-h> :bprevious<cr>
nmap <C-l> :bnext<cr>

" Quickly navigate between windows using `Alt+{h,j,k,l}` no matter if they are displaying
" a normal buffer or a terminal buffer in terminal mode.
" Map to <TAB> is not working, fix it in a later time
" :tnoremap <A-h> <C-\><C-n><C-w>h
" :tnoremap <A-j> <C-\><C-n><C-w>j
" :tnoremap <A-k> <C-\><C-n><C-w>k
" :tnoremap <A-l> <C-\><C-n><C-w>l
" :nnoremap <A-h> <C-w>h
" :nnoremap <A-j> <C-w>j
" :nnoremap <A-k> <C-w>k
" :nnoremap <A-l> <C-w>l

map <leader>ev :e! $MYVIMRC <cr>

" Removes simple highlight
nmap <Leader><space> :nohlsearch<cr>

"/
"/ Laravel Specific
"/
" Open specific laravel directories
nnoremap <Leader>lr :e routes/web.php<cr>
nmap <Leader><Leader>ls :e app/Http/Services<cr>
nmap <Leader><Leader>lm :e app/Http/Models<cr>
nmap <Leader><Leader>lc :e app/Http/Controllers<cr>
nmap <Leader><Leader>lp :e app/Providers<cr>
nmap <Leader><Leader>lcf :e config<cr>


"/
"/ Custom macros
"/
" let @<index>=""

"-------------Plugins--------------------"

"/
"/ NerdTree
"/
" Toogle NerdTree
nmap <silent> <c-n>  :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>
" Customize Arrow fonts
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'
" Quickly go forward or back Netrw in order to make Vinager Plugin to work
let NERDTreeHijackNetrw = 0

"/
"/ Tagbar
"/
" Open the Tagbar window, jump to it and close it on tag selection
nnoremap <Leader>] :TagbarOpenAutoClose<CR>


"/
"/ Airlines
"/
let g:airline#extensions#tabline#enabled = 1             " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'         " Show just the filename
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_powerline_fonts= 1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme='wombat'
"
" let g:airline#extensions#tabline#tab_min_count = 2
" let g:airline#extensions#tabline#show_buffers = 0
" let g:airline#extensions#tabline#show_splits = 1


"/
"/ CtrlP
"/
" Open buffer menu
nnoremap <leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>m :CtrlPMRUFiles<CR>

let g:ctrlp_mruf_relative = 1 "Show only MRU files in the working directory.
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\tags\|git'


"/
"/ vim-easy-align
"/
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"/
"/ IdentLine
"/
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_color_gui = 'gray'
let g:indentLine_color_term = 237
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

"/
"/ Ack
"
if executable('ag') " Configure Ack to use Ag (The Silver Search) (uses the .ignore to ignore files)
  let g:ackprg = 'ag --vimgrep -i -S -U'
endif
nnoremap <Leader>f :Ack!<space>

"/
"/ Greplace
"/
set grepprg=ag                                       " Use Ag (The Silver Search) for searching
let g:grep_cmd_opts = '--line-numbers --noheading'   " Add linenumbers to output
nnoremap <Leader>F :Gsearch<space>


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
let g:UltiSnipsExpandTrigger="<c-space>"         " Add key to trigger UltiSnips snippets. Can not use <tab> to not conflict
                                             " with shortcut for deoplete
                                             
"/
"/ pdv PHP Documenter VIM
"/
let g:pdv_template_dir = $HOME ."/.config/nvim/plugins/pdv/templates_snip"    " The path to the pdv templates
" Shortcut to add php docblocks
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>                         


"/
"/ Vim PHP Namespace
"/
" Insert use statement at the top of the file
"     new Response<-- cursor here or on the name; hit <leader>u now to insert the use statement
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

" Expand the fully qualified classe name
"     new Response<-- cursor here or on the name; hit <leader>ec now to insert the use statement
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>ec <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>ec :call PhpExpandClass()<CR>

let g:php_namespace_sort_after_insert = 1                                   " Sort dependencies every time one is inserted

" Sort php use statements
autocmd FileType php inoremap <Leader>us <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>us :call PhpSortUse()<CR>


"/
"/ Deoplete Padawan
"/
" Register custom neovim commands to start Padawan server
command! PadawanStart call deoplete#sources#padawan#StartServer()
command! PadawanStop call deoplete#sources#padawan#StopServer()
command! PadawanRestart call deoplete#sources#padawan#RestartServer()

" Note : (php igbinary extenion was installed for better padawan
"performance)
" Note 2: Plugin was commented, because there is some bugs at the time I wrote this:
"      https://github.com/padawan-php/padawan.php/issues/71#issuecomment-26402568


"/
"/ Vim PHP CS Fixer
"/
let g:php_cs_fixer_rules = "@PSR2"        " set PSR2 rules to be used on cs fixer
" Shortcuts to apply php-cs-fixer
nnoremap <silent> <F8> :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent> <F9> :call PhpCsFixerFixFile()<CR>


"/
"/ Vim Test
"/
let test#strategy = "neovim"                      " Runs test commands with :terminal
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>



"-------------Auto-Commands--------------"

" Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost init.vim  source %
augroup END

"-------------Ctags----------------------"

set tags+=tags       " set the ctag files



" ---------Notes and Tips---------------"

"/
"/ Commands
"/
" Type @: to repead the last comand-line command. Use @@ for further repeats
" Type f1 to open plugins help menu
" Press <leader><space> to clear simple highlights (custom shortcut)
" Use :registers to see all register list
" Press <leader>s to save the current file (custom shortcut)
" Press <leader>w to delete the current buffer (shortcut to :db)


"/
"/ Coding
"/
" Use ga <base symbol to aline> (From vim-easy-align plugin)
" Use < or > for identation (can be used on visual mode)
"     >iB    Indent contents of current { } block
" Press <leader>u to add use statement to the top of the php file (custom shortcut from vim-php-namespace)
" Press <leader>us to sort use statement for the current php file (custom shortcut from vim-php-namespace)
" Press <leader>ec to expand the fully qualified php class name (custom shortcut from vim-php-namespace)
"
" Press <F8> to run php-cs-fixer into the current file
" Press <F9> to run php-cs-fixer into the current directory
"
" Use "<x> to use the content at register <x>.
"   Examples
"     "ay$    to copy rest of line to register a
"     "6p     to paste the content of register 6
"

" On COMMAND mode, commands for terminal shell can be applied, like:
"     Press <C-p> or <C-n> to go backward and foward to executed commands history
"     Press <C-f> to open a new window with the command history
"     Press <C-b> to go to the beginning of the sentence
"     Press <C-e> to go to the end of the sentence
"     Press <C-h> to delete a char
"     Press <C-w> to delete word
"     Press <C-u> to delete all before cursor
"     Press <C-c> to cancel the command and return to previous windows
"     Press <C-u> to delete sentence
"     Press <C-m> as alias to <cr>
"
"     Use % to reference to current fully qualified filename


"/
"/ Vim PHP CS Fixer
"/
" Press <F8>  to execute php-cs-fixer to the current file
" Press <F9>  to execute php-cs-fixer to the current file

"/
"/ Vim Test
"/
" Press <leader>t , in a test file, to test the current function (Run the last test function runned if it's not in a test file)
" Press <leader>tf , in a test file, to test the current test file. (Run the last test file runned if it's not in a test file)
" Press <leader>ta , in any place, to test all suite test 
" Press <leader>tl , in any place, to run the last test command
" Press <leader>tg , in any place, to open and go the the last test function runned ( even if a suite test or a file test was the last runned test commands)

"/
"/ Searching
"/
" When searching, ( / ) use <C-r> <register> to search for the content of the <register>

"/
"/ Commentary
"/
" Press gcc to comment the current line
" Press gc to comment all selection into visual mode

"/
"/ Surrounding (Vim-Surround)
"/
" Press cs<caracter> to change the surrounding caracter of a text
" Press cst to change the surrounding tag
" Press ds<caracter> to delete the surrounding caracter
" ON visual mode , use S to add surround caracteres

"/
"/ Abolish
"/
" Use :Subvert/di{e,ce}/spinner{,s}/g  as replacement of :s command
" Press crs for snake_case (coerce to snake case)
" Press crm for MixedCase (coerce to mixed case)
" Press crc for camelCase (coerce to camel case)
" Press cru for UPPER_CASE (coerce to upper case)

"/
"/ Navigation
"/
" Press zz to center the line where cursor is located
" Press - to open Vinager file manager
" Press <leader>] to open Tagbar windows with current tags for the file
" Press <C-n> to toogle NERDTree 
" Press  <C-i> and <C-o> jumps foward and backward to jumps
" Press g, and g; to go foward and backward to edit points (change list is per file)
" Press % to go to the item after or under the cursor. |inclusive| motion. Match itens can be ([{}])	
"


" " Buffers
" Press <leader>b to open buffer list  (custom shortcut from CtrlP)
" Press <leader>. toggle between current and last buffer  (custom shortcut for <C-^>)
" Press <C-l> and <C-h> to go foward and backward to the buffer list
"
" " Marks
" Press m<a letter> to set a mark in the current file e use `<letter> to go to the mark (mark works only per file)
	"   example: mm
	" can be used in combination to other commands: v`a (select until the mark)
" Press m<capital letter> to set a mark in the current file e use `<capital letter> to go to the mark from any file
" Use :marks to show all marks available (local marks and global marks(capital letters))
" Notes : Marks leaves across sections (open and close vim, and the marks remains)
"
" " Tags
" Press <C-]> to navigate to the tag where cursor is located <ctags> or
" :tags <text>  to go the first ocurrenct of <text> on ctags file
" Press :tselect or g] to open the list of tags
"     :tn to go to the next occurence
"     :tp to go to the prevous occurence
"     :pop or Use <C-t> to go back through the ctags queue

" " Tabs
" Tabs can be used to split collections of windows. For example: windows with
" buffers of test files and src files:
" Summary :
"     A buffer is the in-memory text of a file.
"     A window is a viewport on a buffer.
"     A tab page is a collection of windows.
"
" Press gt or :tagnext to go to the next tab page. Or use <x>tb/:tagnext to go to the x tab page
" Press gT or :tagprevious to go to the previous tab page.


"/
"/ NERDTree
"/
" Press <C-n> to toogle NERDTree (custom shortcut)
"     Press o to open or close a noden. If file, opens the file into current buffer
"     Press s to open vsplit
"     Press i to open vplit
"     Press t to open in new tab
"     Press q to close NerdTree windows
"     Press a to toggle zoom NerdTree windows
"     Press m to open a helpful menu with some helper methods, <ESC> to exit menu
" Press <leader>m to open most used files list (custom shortcut)

"/
"/ Vinager (wrapper for netrw ot enhance it)
"/
" Press - to open Vinager file manager
"     Type f1 to show helper
"     Press d to create a new directory
"     Press D to attempt to delete file/directory
"     Press o to enter the file/directory under the cursor in a new browser window.  A horizontal split is used.
"     Press v to enter the file/directory under the cursor in a new browser window.  A vertical split is used.
"     Press i to cycle between thin, long, wide, and tree listings
"     Press p to preview the file (open a preview viewport)
"     Press R to rename the file/directory
"     Press % to create a new file in the current directory


"/
"/ Tagbar
"/
" Press <leader>] to open tagbar windows with current tags for the file
"     Press p to preview the tag into the file
"     Press <cr> to select tag and close the tagbar windows
"     Press q to close tagbar windows


"/
"/ Spliting
"/
" Press <C-w>| to expand vertically
" Press <C-w>_ to expand horizontally
" Press <C-w>= to back to default splitings
" Use <C-w>+ or <C-w>- to resize horizontally
" Use <C-w>< or <C-w>> to resize vertically
" Use <C-w>r or <C-w>r to rotate the vieports
" Use <C-w>o to close all splits and left current buffer full screen
" Press :vsp to split vertically
" Press :sp  to split horizontally

"/
"/ CtrlP
"/
" Press C-p to open CtrlP menu file explorer
" Press C-c to close CtrlP menu file explorer
" Press C-j or C-j to navigate during CtrlP explorer
" Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
" Press <c-f> and <c-b> to cycle between modes.
" Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab (c-t) or in a new split (c-v), or special program (c-x)
"     Use <c-o> to see a list options on how to open the current file
" Press <c-d> to toggle between full-path search and filename only search.
" Press <c-r> to toggle between the string mode and full regexp mode.
" Use <c-y> to create a new file and its parent directories.

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
"    Use :diffget to get the content of the other buffer (index / local) - needs to save file to apply changes
"        or just press do (does not work on VISUAL mode)
"    Use :diffput to put the content of the other buffer (index / local) - needs to save file to apply changes
"        or just press dp (does not work on VISUAL mode)
"    Use :diffupdate  to forcei the diferences to be updated on the screen (complicated changes are not updated automatically)
" Use :Git add % to	stage the current file to the index (equivalent to :Gwrite, but does not update the buffer)
" Use :Git checkout % to revert current file to last checked in version (equivalent to :Gread, but does not update the buffer)
" Use :Git rm %	to delete the current file and the corresponding Vim buffer (equivalent to :Gremove, but does not update the buffer)
" Use :Git mv % to rename the current file and the corresponding Vim buffer (equivalent to :Gmove, but does not update the buffer)

"/
"/ Ack (Searching)
"/
" Press <Leader>f to execute :Ack command to find for an expression
" The Ack searches for regular expression, so if needs to find the string 'something()', need to type something\(\)
" The second parameter is the file/directory to search. Example: to search only in the current file, use:
"     :Ack needed %
"
"    ?   to open help menu
"    O   to open and close the quickfix windows
"    o   to open (same as Enter)
"    go  to preview file, open but maintain focus on ack.vim results
"    q   to close the quick fix windows


"/
"/ Deoplete (auto complete)
"/
" Press <TAB> to navigate through popup options
" or <C-n> and <C-p> to go foward and backward through popup options
" Press <C-h> to close popup and delete backword char

"/
"/ UltiSnips ( integrated to Deoplete )
"/
" On Deoplete pop, selecte the snippet and type <c-space> to trigger
" or just type the snippet name and type <c-space>

"/
"/ pdv PHP Documenter VIM
"/
" Press <leader>d into a line of a function to put the docblocks that function
" --------- Helpers ---------------"

"/
"/ Helper scripts
"/
" ~/bin/ctags-update.sh


"/
"/ External libs
"/
" - universal-ctags (for tagging files) - uses .ctagsignore to ignore files
" - ryanoasis/nerd-fonts for fonts with devicons
" - ggreer/the_silver_searcher (ag for code searching) - uses .ignore to ignore files
