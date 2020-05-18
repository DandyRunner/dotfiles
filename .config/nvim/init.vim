let mapleader =","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'joshdick/onedark.vim' "https://github.com/joshdick/onedark.vim
Plug 'itchyny/lightline.vim' "https://github.com/itchyny/lightline.vim
Plug 'vim-airline/vim-airline' "https://github.com/vim-airline/vim-airline
Plug 'preservim/nerdtree' "https://github.com/preservim/nerdtree
Plug 'ctrlpvim/ctrlp.vim' "https://github.com/ctrlpvim/ctrlp.vim
Plug 'sheerun/vim-polyglot' "https://github.com/sheerun/vim-polyglot
Plug 'preservim/nerdcommenter' "https://github.com/preservim/nerdcommenter
Plug 'neoclide/coc.nvim', {'branch': 'release'} "https://github.com/neoclide/coc.nvim
Plug 'tpope/vim-surround'  "https://github.com/tpope/vim-surround
Plug 'airblade/vim-gitgutter'  "https://github.com/airblade/vim-gitgutter
Plug 'psliwka/vim-smoothie' "https://github.com/psliwka/vim-smoothie
call plug#end()

" Leader Mapping
map <Space> <leader>

" Toggle NERDTree
map <leader>n :NERDTreeToggle<CR>

" Tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Coc Mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)


" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Move around buffers
nnoremap <C-J> :bprev<CR>
nnoremap <C-K> :bnext<CR>


"Starting directory CtrlP
let g:ctrlp_working_path_mode = 'ra'

" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/bundle/*,*/node_modules/

syntax on
colorscheme onedark
set termguicolors

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

let g:airline_theme='onedark'

let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1


hi CursorLine gui=bold ctermbg=blue ctermfg=black guibg=darkblue
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set cursorline! cursorcolumn!

set autoread
set clipboard+=unnamedplus            " Maps yank to clipboard buffer (needs xsel)
set backspace=indent,eol,start        " http://vi.stackexchange.com/a/2163
set listchars=extends:→               " Show arrow if line continues rightwards
set listchars+=precedes:←             " Show arrow if line continues leftwards
set nobackup nowritebackup noswapfile " Turn off backup files
set history=500
set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape
set expandtab shiftwidth=4 tabstop=4  " Four spaces for tabs everywhere
set number
