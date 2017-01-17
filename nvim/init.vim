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

" customize the Visual mode color
hi Visual ctermfg=231 ctermbg=59 guifg=fg guibg=#605A79


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

" Quick write NeoVim session for the project to be restored later
nnoremap <F2> :mksession! .neovimsession.vim <cr>
" Restore NeoVim session for the project
nnoremap <F3> :source .neovimsession.vim <cr>

" shortcut for esc in insert mode
inoremap jj <esc>

" Improved match list command
noremap [I [I:let nr = input("Type the number and \<Enter\>: ")<Bar>exe "normal " . nr ."[\t"<CR>

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
tnoremap jj <C-\><C-n>


" remap to undo paste command into insert mode. In fact, it undo the changes since last <C-R> command.
" See i_CTRL-G_u
inoremap <C-R> <C-G>u<C-R>


"/
"/ Laravel Specific
"/
" Open specific laravel directories
nnoremap <Leader><Leader>lr :e routes/web.php<cr>
nnoremap <Leader><Leader>ls :e app/Http/Services<cr>
nnoremap <Leader><Leader>lm :e app/Http/Models<cr>
nnoremap <Leader><Leader>lc :e app/Http/Controllers<cr>
nnoremap <Leader><Leader>lp :e app/Providers<cr>
nnoremap <Leader><Leader>lcf :e config<cr>


"/
"/ Custom macros
"/
" let @<index>=""


"-------------Plugins--------------------"

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
" Quickly go forward or back Netrw in order to make Vinager Plugin to work
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



"/
"/ Grepper
"
" Configure tools from grepper. By default grepper will use the first tool of the list
"    ['ag', 'ack', 'grep', 'findstr', 'rg', 'pt', 'sift, 'git']
"    Configured ag to use smartcase and to ignore VCS ignore files (.gitignore, .hgignore).
"         But it still uses .ignore files to ignore files on search
let g:grepper = {
    \ 'next_tool': '<leader>f',
    \ 'ag': {
    \   'grepprg':    'ag --vimgrep -i -S -U',
    \ }}
let g:grepper.highlight = 1        " Highlight found matches.
let g:grepper.simple_prompt = 1    " Only show the tool name in the prompt, without any of its arguments.

" Shortcuts for Grepper
nnoremap <leader>f :Grepper<cr>
nnoremap <leader>F :Grepper -buffer<cr>
nnoremap <leader>* :Grepper -cword -noprompt<cr>
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
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>


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
    autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
    autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
    autocmd FileType php inoremap <Leader>ec <Esc>:call IPhpExpandClass()<CR>
    autocmd FileType php noremap <Leader>ec :call PhpExpandClass()<CR>
    " Sort php use statements
    autocmd FileType php inoremap <Leader>us <Esc>:call PhpSortUse()<CR>
    autocmd FileType php noremap <Leader>us :call PhpSortUse()<CR>
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
" Shortcuts to apply php-cs-fixer, and after update lint with Neomake
nnoremap <silent> <F8> :call PhpCsFixerFixDirectory()<CR> :Neomake<CR>
nnoremap <silent> <F9> :call PhpCsFixerFixFile()<CR> :Neomake<CR>

"/
"/ Neomake (assyn lint framework)
"/
" Run Neomake on the current file on every write:
" let g:neomake_open_list = 2       " open the location windows with the lin errors without move the cursor
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
nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
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

" Run :CheckHealth to detect neovim problems


"/
"/ Commands
"/
" Type @: to repead the last comand-line mode command. Use @@ for further repeats
" Type f1 to open plugins help menu
" Press <leader><space> to clear simple highlights (custom shortcut)
" Use :registers to see all register list
" Press <leader>s to save the current file (custom shortcut)
" Press <leader>w to delete the current buffer (shortcut to :db)
" Use :wa to write all buffers
" Use <c-v> to enter on visual block mode

"/
"/ Terminal emulator
"/
" Type :terminal <cmd> to create a new terminal buffer executing the optinal <cmd> command
" Use vs/sp +term  to open a windows with a terminal buffer
" Use vs/sp +term  to open a windows with a terminal buffer
" Type :!! to repeat the last terminal command
" On terminal window: 
"     Press <esc> or jj to go back to normal mode
"     Press i to enter insert mode



"/
"/ Coding
"/
" Use ga <base symbol to aline> (From vim-easy-align plugin)
" Use < or > for identation (can be used on visual mode)
"     >iB    Indent contents of current Block
" Press <leader>u to add use statement to the top of the php file (custom shortcut from vim-php-namespace)
" Press <leader>us to sort use statement for the current php file (custom shortcut from vim-php-namespace)
" Press <leader>ec to expand the fully qualified php class name (custom shortcut from vim-php-namespace)
"
" Press <F8> to run php-cs-fixer into the current file
" Press <F9> to run php-cs-fixer into the current directory
" Press <number>]e moves the current line <number> lines below, or <number>[e to move above
" Press <number>]<space> to inserts 5 blank lines below  the current line or <number>[<space> to insert above 
" Use motion b to reference to block:
"     ab       copy a block ( equivalent to a( )
"     aB       ident a Block ( equivalent to a{ )
" Use "<x> to use the content at register <x>.
"     Examples
"       "ay$    to copy rest of line to register a
"       "6p     to paste the content of register 6
"     Use + register to access system clipboard:
"         Examples
"             "+y<motion>   puts the content of the motion into the system clipboard.
"
"         Pasting from this register usually produces better results than using the system paste (<c-v>)
"         command in Insert mode
"     Registers :
"         Register 0: Last yank.
"         Register 1: Last deletion.
"         Register 2: Second last deletion.
"         And so on. Think of registers 1-9 as a read-only queue with 9 elements.
"         Register % contains the name of the current file
"
" Motions 
"  (     sentences backward.
"  )     sentences forward.
"  {     paragraphs backward.
"  }     paragraphs forward.
"
"
" On COMMAND mode:
"     Press <c-p> or <C-n> to go backward and foward to history inputs (same as <down> and <up>)
"     Press <c-f> to open a new window with the command history
"     Press <c-b> to go to the beginning of the sentence
"     Press <c-e> to go to the end of the sentence
"     Press <c-h> to delete a char
"     Press <c-w> to delete word
"     Press <c-u> to delete all before cursor
"     Press <c-c> to cancel the command and return to previous windows
"     Press <c-u> to delete sentence
"     Press <c-m> as alias to <cr>
"     Press <c-r> <register> to search for the content of the <register>
"     Press <c-r><c-w> to insert for the <cword> (word under the cursor)
"     Press <c-r><c-a> to insert for the WORD under the cursor
"     Press <c-r><c-f> to insert for the <cfile> (the file path under the cursor)
"     Use % to reference to current fully qualified filename
"
" On Insert mode
"     Press <c-o> to execute a single command on normal mode and go back automatically to insert mode
"     Press <c-r><id> to paste the content of the register of <id>

"/
"/ Navigation
"/
" Press zz to center the line where cursor is located
" Press - to open Vinager file manager
" Press <c-\> to open Tagbar windows with current tags for the file
" Press <C-n> to toogle NERDTree
" Press  <C-i> and <C-o> jumps foward and backward to jumps
" Press g, and g; to go foward and backward to edit points (change list is per file)
" Press % to go to the item after or under the cursor. |inclusive| motion. Match itens can be ([{}])
" Press [I to display all lines that contain the keyword under the cursor on current filenames
"


" " Buffers
" Press <leader>b to open buffer list  (custom shortcut from CtrlP)
" Press <leader>. toggle between current and last buffer  (custom shortcut for <C-^>)
" Press <C-l> and <C-h> to go foward and backward to the buffer list
" Use :wa to save all buffers
" Use :bufdo {command} to execute the {command} in every open buffer
"   :bufdo bd    to delete all buffers
"
" " Marks
" Press m<a letter> to set a mark in the current file e use `<letter> to go to the mark (mark works only per file)
        "   example: mm
        " can be used in combination to other commands: v`a (select until the mark)
" Press m<capital letter> to set a mark in the current file e use `<capital letter> to go to the mark from any file
" Use :marks to show all marks available (local marks and global marks(capital letters))
" Notes : Marks leaves across sections (open and close Neovim, and the marks remains)
"
" " Tags
" Press <C-]> to navigate to the tag where cursor is located <ctags> or
" :tags <text>  to go the first ocurrenct of <text> on ctags file
" Press :tselect or g] to open the list of tags
"     :tn to go to the next occurence
"     :tp to go to the prevous occurence
"     :pop or Use <C-t> to go back through the ctags queue

" " Windows
"
" Use :vs to open a new vertical window
" Use :sp to open an new horizontal window


" " Tabs
" Tabs can be used to split collections of windows. For example: windows with buffers of test files and src files:
" Summary :
"     A buffer is the in-memory text of a file.
"     A window is a viewport on a buffer.
"     A tab page is a collection of windows.
"
" Press gt or :tagnext to go to the next tab page. Or use <x>tb/:tagnext to go to the x tab page
" Press gT or :tagprevious to go to the previous tab page.

"/
"/ Command Mode Searching
"/
" Press * to immediately search for the work in cursor



"/
"/ Substitution
"/
" Use s command to substitution. <range>s/<pattern>/<string>/<flags>
"     :%s/foo/bar/          On each line, replace the first occurrence of "foo" with "bar".
"     :s/foo/bar/g          Find each occurrence of 'foo' (in the current line only), and replace it with 'bar'.
"     :%s/foo/bar/gc        Change each 'foo' to 'bar', but ask for confirmation first.
"     :%s/\<foo\>/bar/gc    Change only whole words exactly matching 'foo' to 'bar'; ask for confirmation.
"


"/
"/ Better Whitespace
"/
" Use :StripWhitespace to remove extra whitespaces on current buffer


"/
"/ Rename
"/
" Use :Rename to rename a file within NeoVim and on the disk automatically (Note: NERDTree needs to be refresh manually)


"/
"/ Neomake
"/
" Neomake runs link and put the result into the curret windows associated location list windows.
" So to see all the lint errors , type <leader>l or :lopen (open the location windows with the errors )
"   See shortcuts for location windows on Vim-Qf plugin


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
"/ Commentary
"/
" >Press <count>gcc to comment the current line or the count lines
" Press gc<motion> to comment the lines the motion moves over (do not comment single or a bunch of word, only the entire line)
" Press gc to comment all selection into visual mode
" Press gcgc or gcu to uncomment adjacent comment lines (uncoment until it find an uncommented line, in either direction of the cursor)

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
" Press <c-\> to open tagbar windows with current tags for the file
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
" Press <leader>m to open most used files list (custom shortcut)
" Press <leader>b to open buffer list (custom shortcut)
" Press C-c to close CtrlP menu file explorer
" Press C-j or C-j to navigate during CtrlP explorer
" Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
" Press <c-f> and <c-b> to cycle between modes.
" Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab (c-t) or in a new vertical split (c-v), or in new a horizontal split (c-x)
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
" Press <leader>F to execute :Grepper -bufer and enter in prompt to find for an expression in the current buffer
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
