filetype plugin on
filetype on
filetype indent on

let g:loaded_perl_provider = 0

" clipboard to windows
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" coc nvim
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c


if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

"" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>i gg<C-v>G=


"
" not grouped
set mouse=nv
set clipboard=unnamedplus
set number
set relativenumber
set lazyredraw
set hidden
set autochdir
set completeopt=menuone,noinsert,noselect,longest
set shortmess+=c
set cmdheight=2
set whichwrap+=<,>,h,l
set mat=2


" ui
set spellcapcheck=""
"set noerrorbells
set showmatch
set splitright
set splitbelow
set guicursor=
set scrolloff=8 "start scrolling 8 lines before the end or start
set guicursor+=i:ver100-iCursor "the cursor in insert mode

" tab and indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent "
set expandtab
set smartindent
set fileformat=unix
set backspace=eol,start,indent


" wrap
set wrap
set textwidth=0 " wrap till the end of screen
set wrapmargin=0
set colorcolumn=120
set breakindent
set linebreak
set showbreak=>>


" search
set smartcase
set ignorecase


" undo
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.config/nvim/undodir
set undofile

set notimeout

" PlugIns
call plug#begin()

Plug 'mbbill/undotree'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'kentaroi/ultisnips-swift'
Plug 'LunarWatcher/auto-pairs', {'branch': 'develop-4.0.0'}


call plug#end()

let mapleader = " "

" 0 goes to first non-blank character
map 0 ^

" toggle hlsearch with enter
nnoremap <CR> :noh<CR> "

" save and source vimrc
autocmd! BufWritePost $MYVIMRC source $MYVIMRC | echom "Reloaded $NVIMRC"
set number

" run current swift file in terminal
function SaveAndRun()
    execute ':w'
    execute ':! swift %'
endfunction

nnoremap <leader>r : call SaveAndRun()<CR>

"" don't jump fake lines
nnoremap j gj
nnoremap k gk

nnoremap <leader>u :UndotreeToggle<CR>

" zz to put screen in the middle while in insert mode
inoremap zz <C-o>zz



" use leader plus hjkl to move between open windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" leader+vimrc open vimrc file from anyfile
nnoremap <leader>vimrc :tabnew<CR>:edit $MYVIMRC<CR>


" delete all in a file
nnoremap <Leader>da gg0vG$d

augroup deleteTrailingWhiteSpace
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
augroup END

" Return to last edit position when opening files (You want this!)
augroup returnToLastEdited
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

"" lsp
lua << EOF
require'lspconfig'.sourcekit.setup{}
EOF
