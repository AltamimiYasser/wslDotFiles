filetype plugin on
filetype on
filetype indent on

let g:loaded_perl_provider = 0

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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


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
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'kentaroi/ultisnips-swift'


call plug#end()

" ddc
" <TAB>: completion.
"inoremap <silent><expr> <TAB>
"\ ddc#map#pum_visible() ? '<C-n>' :
"\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
"\ '<TAB>' : ddc#map#manual_complete()
"
"" <S-TAB>: completion back.
"inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'
"
"" Use ddc.
"call ddc#enable()
"
"" sources
"call ddc#custom#patch_global('sources', ['around'])
"call ddc#custom#patch_global('sources', ['nvim-lsp'])
"
"call ddc#custom#patch_global('sourceOptions', {
"      \ '_': { 'matchers': ['matcher_head'] },
"      \ 'nvim-lsp': {
"      \   'mark': 'lsp',
"      \   'forceCompletionPattern': '\.\w*|:\w*|->\w*' },
"      \ })
"
"" filters
"" Change source options
""call ddc#custom#patch_global('sourceOptions', {
"            \ 'around': {'mark': 'A'},
"            \ })
"call ddc#custom#patch_global('sourceParams', {
"            \ 'around': {'maxSize': 500},
"            \ })
"
"
"call ddc#custom#patch_global('sourceOptions', {
"            \ '_': {
"                \   'sorters': ['sorter_rank'],
"                \ }
"                \ })
"
"" Use matcher_head.
"call ddc#custom#patch_global('sourceOptions', {
"            \ '_': {
"                \   'matchers': ['matcher_head'],
"                \ }
"                \})
"
"call ddc#custom#patch_filetype(
"            \ ['vim', 'toml'], 'sources', ['necovim'])
"call ddc#custom#patch_global('sourceOptions', {
"            \ '_': {
"                \   'matchers': ['matcher_head'],
"                \   'sorters': ['sorter_rank']
"                \ },
"                \ 'necovim': {'mark': 'vim'},
"                \ })
"
"
"call ddc#custom#patch_global('filterParams', {
"            \   'matcher_fuzzy': {
"                \   'splitMode': 'word'
"                \ }
"                \ })
"
"
"call ddc#custom#patch_global('sourceOptions', {
"  \   '_': {
"  \     'matchers': ['matcher_fuzzy'],
"  \     'sorters': ['sorter_fuzzy'],
"  \     'converters': ['converter_fuzzy']
"  \   }
"  \ })


let mapleader = " "

" 0 goes to first non-blank character
map 0 ^

" toggle hlsearch with enter
nnoremap <CR> :noh<CR> "

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
"
""settings = {
""      ada = {
""        projectFile = "project.gpr";
""        scenarioVariables = { ... };
""      }
""  }
