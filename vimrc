" vim:set ft=vim et sw=2 fen fdm=marker fdl=0:

" Encodings {{{
if !has("win32") && !has("win64")
  set encoding=utf-8
endif

scriptencoding utf-8
set fileencodings=ucs-bom,utf-8,cp936,taiwan,japan,korea,latin1
" }}}

" General settings {{{
set shiftwidth=2
set tabstop=2
set expandtab
set relativenumber
set number

set backspace=indent,eol,start
set nrformats-=octal
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
set fillchars=vert:│,fold:·

set laststatus=2

" indent
set autoindent
set smartindent
set cindent

" show wildmenu
set wildmenu

" do not break words.
set linebreak

set autowrite " Writes on make/shell commands
" Automatically read a file changed outside of vim
set autoread
set hidden " The current buffer can be put to the background without writing to disk

"menuone: show the pupmenu when only one match
" disable preview scratch window,
set completeopt=menu,menuone,longest
" h: 'complete'
set complete=.,w,b,u,t

set scrolloff=1
set sidescrolloff=5
set display+=lastline
set wildignorecase

set incsearch
set hlsearch

if has('patch-7.4.314')
  " don't give ins-completion-menu messages.
  set shortmess+=c
endif
set shortmess+=s

set wrap
" }}}

" Statusline settings {{{

"" Color defines {{{
let s:colors = {
      \ 'default' : [
      \   ['#282828', '#83a598', 30,  235],
      \   ['#a89984', '#504945', 239, 248],
      \   ['#a89984', '#3c3836', 237, 246],
      \   ['#665c54', 241],
      \ ],
      \ 'gruvbox' : [
      \   ['#282828', '#a89984', 246, 235],
      \   ['#a89984', '#504945', 239, 246],
      \   ['#a89984', '#3c3836', 237, 246],
      \   ['#665c54', 241],
      \ ],
      \ 'molokai' : [
      \   ['#080808', '#e6db74', 144, 232],
      \   ['#f8f8f0', '#232526', 16, 253],
      \   ['#f8f8f0', '#293739', 236, 253],
      \   ['#465457', 67],
      \ ],
      \ 'onedark' : [
      \   ['#282C34', '#98C379', 114, 235],
      \   ['#ABB2BF', '#3E4452', 236, 144],
      \   ['#ABB2BF', '#3B4048', 238, 144],
      \   ['#5C6370', 59],
      \ ]}
"" }}}

"" Reset color highlight after change colorscheme {{{
function s:setup_statusline_hi()
  let l:scheme_name = 'default'
  if exists('g:colors_name') && has_key(s:colors, g:colors_name)
    let l:scheme_name = g:colors_name
  endif

  let s:t = s:colors[l:scheme_name]

  exe 'hi! CoreVim_statusline_a ctermbg=' . s:t[0][2] . ' ctermfg=' . s:t[0][3] . ' guibg=' . s:t[0][1] . ' guifg=' . s:t[0][0]
  exe 'hi! CoreVim_statusline_a_bold cterm=bold gui=bold ctermbg=' . s:t[0][2] . ' ctermfg=' . s:t[0][3] . ' guibg=' . s:t[0][1] . ' guifg=' . s:t[0][0]
  exe 'hi! CoreVim_statusline_b ctermbg=' . s:t[1][2] . ' ctermfg=' . s:t[1][3] . ' guibg=' . s:t[1][1] . ' guifg=' . s:t[1][0]
  exe 'hi! CoreVim_statusline_c ctermbg=' . s:t[2][2] . ' ctermfg=' . s:t[2][3] . ' guibg=' . s:t[2][1] . ' guifg=' . s:t[2][0]
  exe 'hi! CoreVim_statusline_z ctermbg=' . s:t[3][1] . ' ctermfg=' . s:t[2][2] . ' guibg=' . s:t[3][0] . ' guifg=' . s:t[2][0]
  exe 'hi! CoreVim_statusline_a_b ctermbg=' . s:t[1][2] . ' ctermfg=' . s:t[0][2] . ' guibg=' . s:t[1][1] . ' guifg=' . s:t[0][1]
  exe 'hi! CoreVim_statusline_a_c ctermbg=' . s:t[2][2] . ' ctermfg=' . s:t[0][2] . ' guibg=' . s:t[2][1] . ' guifg=' . s:t[0][1]
  exe 'hi! CoreVim_statusline_b_c ctermbg=' . s:t[2][2] . ' ctermfg=' . s:t[1][2] . ' guibg=' . s:t[2][1] . ' guifg=' . s:t[1][1]
  exe 'hi! CoreVim_statusline_b_z ctermbg=' . s:t[3][1] . ' ctermfg=' . s:t[1][2] . ' guibg=' . s:t[3][0] . ' guifg=' . s:t[1][1]
  exe 'hi! CoreVim_statusline_c_b ctermbg=' . s:t[1][2] . ' ctermfg=' . s:t[2][2] . ' guibg=' . s:t[1][1] . ' guifg=' . s:t[2][1]
  exe 'hi! CoreVim_statusline_c_z ctermbg=' . s:t[3][1] . ' ctermfg=' . s:t[2][2] . ' guibg=' . s:t[3][0] . ' guifg=' . s:t[2][1]
endfunction

augroup CoreVim_statusline
  autocmd!
  autocmd ColorScheme * :call s:setup_statusline_hi()
augroup END

call s:setup_statusline_hi()
"" }}}

"" Status line define {{{
set statusline=
set statusline+=%#CoreVim_statusline_a_bold#
set statusline+=\                   " Space
set statusline+=%<%n                " Buffer number
set statusline+=\                   " Space
set statusline+=%#CoreVim_statusline_a_c#
set statusline+=
set statusline+=%#CoreVim_statusline_c#
set statusline+=\                   " Space
set statusline+=%{&modified?'*':''}
set statusline+=%f                  " Filename
set statusline+=\                   " Space
set statusline+=%#CoreVim_statusline_c_b#
set statusline+=
set statusline+=%#CoreVim_statusline_b#
set statusline+=\                   " Space
set statusline+=%{&filetype}        " filetype
set statusline+=\                   " Space
set statusline+=%#CoreVim_statusline_b_z#
set statusline+=
set statusline+=%#CoreVim_statusline_z#
set statusline+=\                   " Space
set statusline+=%r                  " Readonly flag

set statusline+=%=                  " Center spaces

set statusline+=%#CoreVim_statusline_b_z#
set statusline+=
set statusline+=%#CoreVim_statusline_b#
set statusline+=%k                  " Value of "b:keymap_name" or 'keymap'
set statusline+=%#CoreVim_statusline_c_b#
set statusline+=
set statusline+=%#CoreVim_statusline_c#
set statusline+=\                   " Space
set statusline+=%{&ff}\|%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}    " file encodings
set statusline+=\                   " Space
set statusline+=%#CoreVim_statusline_b_c#
set statusline+=
set statusline+=%#CoreVim_statusline_b#
set statusline+=\                   " Space
set statusline+=%(%l:%c%V%)         " row/col
set statusline+=\                   " Space
set statusline+=%#CoreVim_statusline_c_b#
set statusline+=
set statusline+=%#CoreVim_statusline_c#
set statusline+=\                   " Space
set statusline+=%P
"" }}}
" }}}

" Mappings {{{

" yank and paste
if has('unnamedplus')
  xnoremap <Leader>y "+y
  xnoremap <Leader>d "+d
  nnoremap <Leader>p "+p
  nnoremap <Leader>P "+P
  xnoremap <Leader>p "+p
  xnoremap <Leader>P "+P
else
  xnoremap <Leader>y "*y
  xnoremap <Leader>d "*d
  nnoremap <Leader>p "*p
  nnoremap <Leader>P "*P
  xnoremap <Leader>p "*p
  xnoremap <Leader>P "*P
endif

" Use Ctrl+* to jump between windows
nnoremap <silent><C-Right> :<C-u>wincmd l<CR>
nnoremap <silent><C-Left>  :<C-u>wincmd h<CR>
nnoremap <silent><C-Up>    :<C-u>wincmd k<CR>
nnoremap <silent><C-Down>  :<C-u>wincmd j<CR>

"Use jk switch to normal mode
inoremap jk <esc>

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

" Remove spaces at the end of lines
nnoremap <silent> ,<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

" Navigation in command line
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

"irssi like hot key
nnoremap <silent><M-1> :<C-u>call <SID>tobur(1)<CR>
nnoremap <silent><M-2> :<C-u>call <SID>tobur(2)<CR>
nnoremap <silent><M-3> :<C-u>call <SID>tobur(3)<CR>
nnoremap <silent><M-4> :<C-u>call <SID>tobur(4)<CR>
nnoremap <silent><M-5> :<C-u>call <SID>tobur(5)<CR>
nnoremap <silent><M-Right> :<C-U>call <SID>tobur("next")<CR>
nnoremap <silent><M-Left> :<C-U>call <SID>tobur("prev")<CR>

fu! s:tobur(num) abort "" {{{
  if index(['Tagbar', 'vimfiler'], &filetype) == -1
    if a:num ==# 'next'
      if tabpagenr('$') > 1
        tabnext
      else
        bnext
      endif

    elseif a:num ==# 'prev'
      if tabpagenr('$') > 1
        tabprevious
      else
        bprev
      endif
    else
      let ls = split(execute(':ls'), "\n")
      let buffers = []
      for b in ls
        let nr = matchstr(b, '\d\+')
        call add(buffers, nr)
      endfor
      if len(buffers) >= a:num
        exec 'buffer ' . buffers[a:num - 1]
      endif
    endif
  endif
endf
"" }}}

"" SpaceVim additional mappings {{{
nnoremap ,<Space>    :<C-U>silent! keeppatterns %substitute/\s\+$//e<CR>
nnoremap <C-Down>    :<C-U>wincmd j<CR>
nnoremap <C-Left>    :<C-U>wincmd h<CR>
nnoremap <C-Q>       <C-W>
nnoremap <C-Right>   :<C-U>wincmd l<CR> :w 
nnoremap <C-S-Down>  :m .+1<CR>==
nnoremap <C-S-Up>    :m .-2<CR>==
nnoremap <C-S>       :<C-U>w<CR>
nnoremap <C-Up>      :<C-U>wincmd k<CR>
nnoremap <C-X>       <C-W>x
nnoremap <Down>      gj
nnoremap <Leader>+   :bnext<CR>
nnoremap <Leader>-   :bprevious<CR>
nnoremap <Leader>P   "+P
nnoremap <Leader>fe  :registers<CR>
nnoremap <Leader>p   "+p
nnoremap <Leader>ql  :copen<CR>
nnoremap <Leader>qn  :cnext<CR>
nnoremap <Leader>qp  :cprev<CR>
nnoremap <Leader>qr  q
nnoremap <S-Tab>     :wincmd p<CR>
nnoremap <SPACE><Tab>  :<C-U>try <bar> b# <bar> catch <bar> endtry<CR>
nnoremap <SPACE>bNh    :<C-U>topleft vertical new<CR>
nnoremap <SPACE>bNj    :<C-U>rightbelow new<CR>
nnoremap <SPACE>bNk    :<C-U>new<CR>
nnoremap <SPACE>bNl    :<C-U>rightbelow vertical new<CR>
nnoremap <SPACE>bNn    :<C-U>enew<CR>
nnoremap <SPACE>bP     :<C-U>normal! ggdG"+P<CR>
nnoremap <SPACE>bY     :<C-U>normal! ggVG"+y``<CR>
nnoremap <SPACE>bn     :<C-U>bnext<CR>
nnoremap <SPACE>bp     :<C-U>bp<CR>
nnoremap <SPACE>ft     :<C-U>e %:p:h<CR>
nnoremap <SPACE>bw     :<C-U>setl readonly!<CR>
nnoremap <SPACE>eh     :<C-U><CR>
nnoremap <SPACE>fCd    :<C-U>update <bar> e ++ff=dos <bar> w<CR>
nnoremap <SPACE>fCu    :<C-U>update <bar> e ++ff=dos <bar> setlocal ff=unix <bar> w<CR>
nnoremap <SPACE>fF     :<C-U>normal! gf<CR>
nnoremap <SPACE>ff     :<C-U>e %:p:h/
nnoremap <SPACE>fS     :<C-U>wall<CR>
nnoremap <SPACE>fr     :brow oldfiles<CR>
nnoremap <SPACE>fs     :<C-U>write<CR>
nnoremap <SPACE>ft     :<C-U>e .<CR>
nnoremap <SPACE>j$     m`g_
nnoremap <SPACE>j0     m`^
nnoremap <SPACE>jb     <C-O>
nnoremap <SPACE>jf     <Tab>
nnoremap <SPACE>jk     j==
nnoremap <SPACE>jn     i<CR><Esc>
nnoremap <SPACE>jo     i<CR><Esc>k$
nnoremap <SPACE>qQ     :<C-U>qa!<CR>
nnoremap <SPACE>qR     :<C-U><CR>
nnoremap <SPACE>qq     :<C-U>qa<CR>
nnoremap <SPACE>qr     :<C-U><CR>
nnoremap <SPACE>qt     :<C-U>tabclose!<CR>
nnoremap <SPACE>sc     :<C-U>noh<CR>
nnoremap <SPACE>tW     :<C-U>setlocal wrap!<CR>
nnoremap <SPACE>thc    :<C-U>set cursorcolumn!<CR>
nnoremap <SPACE>tl     :<C-U>setlocal list!<CR>
nnoremap <SPACE>tmT    :<C-U>if &laststatus == 2 <bar> let &laststatus = 0 <bar> else <bar> let &laststatus = 2 <bar> endif<CR>
nnoremap <SPACE>tn     :<C-U>setlocal nonumber! norelativenumber!<CR>
nnoremap <SPACE>w-     :<C-U>bel split <bar> wincmd w<CR>
nnoremap <SPACE>w/     :<C-U>belowright vsplit <bar> wincmd w<CR>
nnoremap <SPACE>w2     :<C-U>silent only <bar> vs <bar> wincmd w<CR>
nnoremap <SPACE>w3     :<C-U>silent only <bar> vs <bar> vs <bar> wincmd H<CR>
nnoremap <SPACE>w<Tab> :wincmd w<CR>
nnoremap <SPACE>w=     :<C-U>wincmd =<CR>
nnoremap <SPACE>wH     :<C-U>wincmd H<CR>
nnoremap <SPACE>wJ     :<C-U>wincmd J<CR>
nnoremap <SPACE>wK     :<C-U>wincmd K<CR>
nnoremap <SPACE>wL     :<C-U>wincmd L<CR>
nnoremap <SPACE>wS     :<C-U>bel split<CR>
nnoremap <SPACE>wV     :<C-U>bel vs<CR>
nnoremap <SPACE>wd     :<C-U>close<CR>
nnoremap <SPACE>wf     :<C-U>tabnew<CR>
nnoremap <SPACE>wh     :<C-U>wincmd h<CR>
nnoremap <SPACE>wj     :<C-U>wincmd j<CR>
nnoremap <SPACE>wk     :<C-U>wincmd k<CR>
nnoremap <SPACE>wl     :<C-U>wincmd l<CR>
nnoremap <SPACE>wm     :<C-U>only<CR>
nnoremap <SPACE>wo     :<C-U>tabnext<CR>
nnoremap <SPACE>ws     :<C-U>bel split <bar> wincmd w<CR>
nnoremap <SPACE>wv     :<C-U>belowright vsplit <bar> wincmd w<CR>
nnoremap <SPACE>ww     :<C-U>wincmd w<CR>
nnoremap <Tab>       :wincmd w<CR>
nnoremap <Up>        gk
nnoremap [<Space>    :<C-U>put! =repeat(nr2char(10), v:count1)<CR>
nnoremap [C            9999[c
nnoremap [b          :<C-U>bN <bar> stopinsert<CR>
nnoremap [e          :<C-U>execute 'move -1-'. v:count1<CR>
nnoremap [l          :lprevious<CR>
nnoremap [p          P
nnoremap [t          :tabprevious<CR>
nnoremap ]<End>      ddGp``
nnoremap ]<Home>     ddggP``
nnoremap ]<Space>    :<C-U>put =repeat(nr2char(10), v:count1)<CR>
nnoremap ]C            9999]c
nnoremap ]b          :<C-U>bn <bar> stopinsert<CR>
nnoremap ]e          :<C-U>execute 'move +'. v:count1<CR>
nnoremap ]l          :lnext<CR>
nnoremap ]p          p
nnoremap ]t          :tabnext<CR>
nnoremap gp          '`['.strpart(getregtype(), 0, 1).'`]'
nnoremap gr          :<C-U>tabprevious<CR>
nnoremap z<Left>     zh
nnoremap z<Right>    zl
snoremap <BS>        <C-G>c
snoremap <C-H>       <C-G>c
snoremap <C-R>       <C-G>"_c<C-R>
snoremap <Del>       <C-G>c
vnoremap <C-S-Down>  :m '>+1<CR>gv=gv
vnoremap <C-S-Up>    :m '<-2<CR>gv=gv
vnoremap <C-S>       :<C-U>w<CR>
vnoremap <SPACE>xU   gU
vnoremap <SPACE>xu   gu
vnoremap <SPACE>xwc  :<C-U>normal! :'<,'>s/\w\+//gn<CR><CR>
vnoremap ]<End>      dGp``
vnoremap ]<Home>     dggP``
xnoremap <S-Tab>     <gv
xnoremap <Tab>       >gv
xnoremap \P          "+P
xnoremap \d          "+d
xnoremap \p          "+p
xnoremap \y          "+y
"" }}}
" }}}
