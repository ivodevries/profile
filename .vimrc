"let $HOME='/home/ivo'
"echo $HOME
" {{{ syntax highlighting
syn on
au BufNewFile,BufRead *.phtml set filetype=php
au BufNewFile,BufRead *.hbs set filetype=handlebars
au BufNewFile,BufRead *.tmx set filetype=xml
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.ts set filetype=typescript
" }}}

" {{{ code coloring
highlight Folded ctermbg=blue ctermfg=white
highlight FoldColumn ctermbg=darkgrey ctermfg=red
hi Comment ctermfg=blue
hi TabLineSel ctermbg=2 ctermfg=7
hi TabLine ctermbg=7 ctermfg=0
hi Pmenu ctermbg=darkblue
hi Pmenu ctermfg=lightgrey
hi Directory ctermfg=cyan
hi Comment  ctermfg=blue
let php_htmlInStrings=1

" }}}

" {{{ indenting
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set nowrap
set number
set autoindent
set smartindent
"set cindent
" }}} 
 
" {{{ encoding
language en_US.utf8
" let &termencoding = &encoding
set fileencoding=utf-8
set encoding=utf-8
" }}}

" {{{ search
set ignorecase
set smartcase
set incsearch
set showmatch
set nohlsearch
" }}}

" {{{ code formatting
filetype plugin on
au FileType php set omnifunc=youcompleteme#OmniComplete
set commentstring=\ //\ %s
set foldmethod=marker
set formatoptions=roc
" }}}

" {{{ misc
set novisualbell " don't blink
set noerrorbells " no noises
set statusline=%F\ %m%r%h%w\ [line=%l/%L][%p%%]
set laststatus=2 " always show the status line
set errorformat=%m\ in\ %f\ on\ line\ %l
set backspace=indent,eol,start

se mouse +=a

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
" don't overwrite yanked text when pasting in visual mode
vnoremap p "_dP 

"set hidden
set undofile
set undodir=~/.vimundo/
"set cursorline
" }}} 

" {{{ Scrolling
set scrolljump=5 " jump 5 regels bij scrollen
set scrolloff=3 " scroll bij 3 regels off the edge
" }}}

" {{{ Code templates
autocmd! BufNewFile * silent! 0r ~/.vim/templates/tmpl.%:e
" }}}

" {{{ Custom vimrc's
let FILEA=expand("../../../../.customvimrc")
if filereadable(FILEA) | exe "source " . FILEA | endif
let FILEA=expand("../../../.customvimrc")
if filereadable(FILEA) | exe "source " . FILEA | endif
let FILEA=expand("../../.customvimrc")
if filereadable(FILEA) | exe "source " . FILEA | endif
let FILEA=expand("../.customvimrc")
if filereadable(FILEA) | exe "source " . FILEA | endif
let FILEA=expand(".customvimrc")
if filereadable(FILEA) | exe "source " . FILEA | endif
" }}}

" {{{ Plugin settings

" {{{ NERDTree
let NERDTreeShowHidden=1 " Show hidden files
let g:NERDTreeDirArrows=0 " Putty doesn't know unicode too well
let NERDTreeIgnore = ['\.sw*$']

" }}}

" {{{ BufferGator
" Suppress buffergator keymaps
let g:buffergator_suppress_keymaps=1
" Split VIEWPORT horizontally, with new split on the top
let g:buffergator_viewport_split_policy="b"
" Keep the catalog open
let g:buffergator_autodismiss_on_select=0
" Disable auto expand window
let g:buffergator_autoexpand_on_split=0
" If greater than 0, this will be the width of the Buffergator window in any
" vertical splitting mode, or its height in any horizontal splitting mode
let g:buffergator_split_size=15
" Enable auto update
let g:buffergator_autoupdate=1

" }}} 

" cs add ~/releases/gem/0.1/ ~/releases/gem/0.1/ " cscope library

" }}}

" {{{ windowing
set splitright
set wmh=0" "set other opened files to just show filename
" }}} 

" {{{ Startup
call pathogen#infect()
autocmd VimEnter * NERDTree
autocmd VimEnter * BuffergatorToggle
autocmd VimEnter * wincmd b

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()


" todo onclose, close nerdtree and buffergator
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
" }}} 
" Toggle left sidebar: NERDTree and BufferGator
fu! LSidebarToggle()
  let b = bufnr("%")
  execute "NERDTreeToggle | BuffergatorToggle"
  execute ( bufwinnr(b) . "wincmd w" )
endf

" {{{ Insert mode mappings
map! ==ivo @author  Ivo de Vries <i.devries@redpebble.nl><LEFT>
map! ==pre echo '<pre>' . print_r($, true) . '</pre>';exit;<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
map! ==dump Lib_Debug::dump($);<LEFT><LEFT>
map! ==dumparr Lib_Debug::dump(Lib_Array::mapSelf($, 'toArray'));<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
map! ==noview $this->_helper->layout->disableLayout(); <cr>$this->_helper->viewRenderer->setNoRender();
map! ==mail $config = Gem::getConfig();<cr>$websiteTitle = $config->website_title;<cr>$fromEmail = $config->contact_email;<cr><cr>$mail = new Zend_Mail('UTF-8');<cr>$mail->setFrom($fromEmail, $websiteTitle);<cr>$mail->addTo($fromEmail, $websiteTitle);<cr>$mail->setSubject('Reactie van de website')<cr>$mail->setBodyText(trim($bodyText));<cr>$mail->setBodyHtml($this->getView()->render('emails/...phtml'));<cr>$mail->send();
map! ==error ini_set('display_errors', 1);<CR>error_reporting(E_ALL);



map! ==property <esc>gg/classoprotected $_property;opublic function getProperty() {}jjka		if(is_null($_property)) {}jjoreturn $this->_property;jjkkkkhhhhhhhhhhhhathis->jjja			$propertyModule = Gem::getModule('property');jjo$this->_property = $propertyModule->getInstance($this->_values['propertyId']);jj:w

" }}}

vmap <C-t> :SubstituteCase/oudermatch/huishoudmatch/g<cr>

" {{{ F-key mappings 
map <F1> :set paste<CR>
map <F2> :set nopaste<CR>
"set pastetoggle=<F2>


" }}}
"
" {{{ CTRL mappings 
source ~/.vim/php-doc.vim 
inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-D> :call PhpDocSingle()<CR> 
vnoremap <C-D> :call PhpDocRange()<CR> 

map  <silent> <C-Y>  <esc>:call LSidebarToggle()<cr>
map! <silent> <C-Y>  <esc>:call LSidebarToggle()<cr>

map <c-\> :Bclose<cr>:bn<cr>:bp<cr>
map  <C-F> :%s/\s/ /g<cr>:call g:Jsbeautify()<cr>
map  <C-S> :%s/\s\+$//<cr>
map  <C-C> ^<down>?{<cr>V%
set nocompatible
map <C-U> ?><CR>/\s\@!<CR>i<?=$this->translate('<ESC>/<<CR>?\s\@!<CR>a')?><ESC>
map <C-n> ?<?kb\?=lla$this->escape(/?>i)

" }}}

map <C-k> :w! ~/.vimclipboard<cr>
map <C-l> :r ~/.vimclipboard<cr>
map <C-l><C-l> :!cat ~/.vimclipboard<cr>

map <C-i> :bp<CR>
map <C-o> :bn<CR>

set hidden "switch between buffers without saving
imap jj <ESC>
imap JJ <ESC>

map = :vertical resize +5<cr>
map - :vertical resize -5<cr>

autocmd BufWritePost less/global.less silent! !touch less/frontend.less
autocmd BufWritePost less/global.less silent! !touch less/register.less
autocmd BufWritePost less/global.less silent! !touch less/backend.less

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
