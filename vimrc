set shiftwidth=2
set tabstop=2
set expandtab
set relativenumber
set number

set backspace=indent,eol,start
set nrformats-=octal
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
set fillchars=vert:│,fold:·

" indent
set autoindent
set smartindent
set cindent

" show wildmenu
set wildmenu

" do not break words.
set linebreak

"menuone: show the pupmenu when only one match
" disable preview scratch window,
set completeopt=menu,menuone,longest
" h: 'complete'
set complete=.,w,b,u,t

set incsearch
set hlsearch

imap jk <ESC>
imap kj <ESC>
nmap <SPACE><TAB> :e #<CR>
nmap <SPACE>fs :w<CR>
nmap <SPACE>fS :wa<CR>
nmap <SPACE>fr :brow oldfiles<CR>

nnoremap <Leader>lj :lnext<CR>
nnoremap <Leader>lk :lprev<CR>
nnoremap <Leader>lq :lclose<CR>

nnoremap <Leader>qj :cnext<CR>
nnoremap <Leader>qk :cprev<CR>
nnoremap <Leader>qq :cclose<CR>

"]<End> or ]<Home> move current line to the end or the begin of current buffer
nnoremap <silent>]<End> ddGp``
nnoremap <silent>]<Home> ddggP``
vnoremap <silent>]<End> dGp``
vnoremap <silent>]<Home> dggP``


"Ctrl+Shift+Up/Down to move up and down
nnoremap <silent><C-S-Down> :m .+1<CR>==
nnoremap <silent><C-S-Up> :m .-2<CR>==
inoremap <silent><C-S-Down> <Esc>:m .+1<CR>==gi
inoremap <silent><C-S-Up> <Esc>:m .-2<CR>==gi
vnoremap <silent><C-S-Down> :m '>+1<CR>gv=gv
vnoremap <silent><C-S-Up> :m '<-2<CR>gv=gv

" Start new line
inoremap <S-Return> <C-o>o

" Improve scroll, credits: https://github.com/Shougo
nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
    \ 'zt' : (winline() == &scrolloff + 1) ? 'zb' : 'zz'
noremap <expr> <C-f> max([winheight(0) - 2, 1])
    \ ."\<C-d>".(line('w$') >= line('$') ? "L" : "H")
noremap <expr> <C-b> max([winheight(0) - 2, 1])
    \ ."\<C-u>".(line('w0') <= 1 ? "H" : "L")
noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")

" Select blocks after indenting
xnoremap < <gv
xnoremap > >gv|

" Use tab for indenting in visual mode
xnoremap <Tab> >gv|
xnoremap <S-Tab> <gv
nnoremap > >>_
nnoremap < <<_

" smart up and down
nnoremap <silent><Down> gj
nnoremap <silent><Up> gk

" Navigation in command line
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" Remove spaces at the end of lines
nnoremap <silent> ,<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

