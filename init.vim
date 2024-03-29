"SETEOS BASICOS DE NVIM
syntax on

set number
set mouse=a
set noerrorbells
set sw=2
set smartindent
set rnu
set numberwidth=1
set noswapfile
set nobackup
set incsearch
set ignorecase
set clipboard=unnamedplus
set encoding=utf-8
set showmatch 
set cursorline
set termguicolors
set splitbelow
set splitright "Last
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
:nnoremap a <Esc>


"LLAMADO DE LOS PLUGINS
"..................................................................................................................................
"..................................................................................................................................

call plug#begin('~/.Users/Lenovo/AppData/Local/nvim') "UBICACION DE DONDE QUIERO GUARDAR LOS PLUGINS  

Plug 'morhetz/gruvbox'  "TEMA
Plug 'scrooloose/nerdtree' "NerdTree me permite ver el arbol de archivos que tengo
Plug 'christoomey/vim-tmux-navigator' "Me permite navegar entre varias ventanas que haga
Plug 'easymotion/vim-easymotion' "Me ayuda a realizar busquedas de una manera muy sencilla
Plug 'sheerun/vim-polyglot' "Me ayuda a hacer resaltado de lenguajes 
Plug 'jiangmiao/auto-pairs' "Me ayuda a completar los caracteres especiales que llevan pares ejemplo (), {} []
Plug 'yggdroot/indentline' "Me da una linea guia para poder ver la sangria en mis bloques de codigo
Plug 'scrooloose/nerdcommenter' "Puedo realizar comentarios sobre el codigo en donde me encuentro
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Con esto puedo jalar lengajes de progra para autocompletar
Plug 'tpope/vim-surround' "Me ayuda a encerrar dentro de una etiqueta o caracter especial palabras o codigo
Plug 'itchyny/lightline.vim' "Me da un status para la barra y me indica tipo de cosas que estan pasando en el archivo
Plug 'mattn/emmet-vim' "Me ayuda a realizar autocompletados para archivos HTML y CSS
Plug  'othree/html5.vim' "Este plugin me aguanta tener archivos css y javascript dentro de mi html
Plug 'ternjs/tern_for_vim', {'do':'npm install'} "Autocompletado de JS con varias librerias escribir Ctrl+x y despues Ctrl+O para abrir el panel de autocompletado
Plug 'dense-analysis/ale' 
Plug 'jlanzarotta/bufexplorer' "Explorador de Buffers
Plug 'folke/tokyonight.nvim', { 'branch': 'main' } "TEMA TOKYIO NIGHT
Plug 'ThePrimeagen/vim-be-good' "Es para practicar ejercicios del uso de VIM
Plug 'junegunn/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc-snippets', "Herramienta para el autocompletado
call plug#end()


"CONFIGURACION DE COC
"...............................................................................................................................................
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
"" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" rive more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
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
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" Configuraciones para CoC
set completeopt=menu,menuone,noselect
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-python',
  \ 'coc-css',
  \ 'coc-vimlsp'
\]

" Si el menú de autocompletado está abierto...
" TAB seleccionará la opción siguiente.
" Shift-TAB seleccionará la opción anterior.
" ENTER seleccionará la opción actual.
" ESCAPE cerrará el menú.
"inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
"inoremap <expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
"inoremap <expr> <ESC> pumvisible() ? coc#_close_popup() : "\<ESC>"

let g:coc_config = { 'suggest.noselect': v:false }
"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:coc_snippet_next = '<tab>'

"SETEO DE LOS TEMAS

"GRUVBOX
"...................................................................................................................................
"..................................................................................................................................."

"set background=dark
"let gruvbox_contrast_dark='soft'
"colorscheme gruvbox

"TOKYIO NIGHT
"...................................................................................................................................
"...................................................................................................................................

"colorscheme tokyonight

" There are also colorschemes for the different styles
"colorscheme tokyonight-night
colorscheme tokyonight-storm
"colorscheme tokyonight-day
"colorscheme tokyonight-moon

"MAPS
"...................................................................................................................................
"...................................................................................................................................
let mapleader=" "

"NERDTREE
map <leader>nt :NERDTreeFind<CR>


"COMANDOS DE VIM PARA MAYOR FACILIDAD
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>sr :source%<CR>

"SPLIT RESIZE
nnoremap <leader>> 10<C-w>>
nnoremap <leader>< 10<C-w>< 

"MUX NAVIGATOR
nnoremap <silent> <leader><C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <leader><C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <leader><C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <leader><C-l> :TmuxNavigateRight<CR>

"TERMINAL 
nnoremap <leader>t :split<CR>:terminal<CR>:resize 50 <CR>

"CERRAR LAS VENTANAS QUE NO QUIERO 
nnoremap <leader>o :only <CR>

"PARA ABRIR UNA NUEVA VENTANA PARALELA
noremap <leader>v :vsp <CR>
noremap <leader>h :sp <CR>
noremap <leader>vv <c-w>v <CR>

"NERD COMMENTER
"<leader>c<leader>   se deja de esta manera asi porque es el default

"EASY MOTION	
nmap <leader>s <Plug>(easymotion-s2)

"KEYS FOR GO TO (NAVEGAR ENTRE ARCHIVOS)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"BUFFERS
"\<Leader\>be normal open

"\<Leader\>bt toggle open / close

"\<Leader\>bs force horizontal split open

"\<Leader\>bv force vertical split open

"FASTER SCROLLING
nnoremap <C-j> 10j<C-e>
nnoremap <C-k> 10k<C-y>

"VIM SURROUND ESTE COMANDO SE USA: ESPACIO S MAYUSCULA Y TODO LO QUE QUIERA
"ENVOLVER EN MODO VISUAL Y EL CARACTER QUE SE UTILIZARA
xmap s <Plug>VSurround  

"FZF 
"nnoremap <silent> <C-f> :Files<CR>
map <leader>fz :Files<CR>
map <leader>ag :Ag<CR>


"EJECUCION DE LOS DIFERENTES PROGRAMAS
"..................................................................................................................................
"..................................................................................................................................

"Para correr Python de una vez
map <leader>p :sp<CR>:term python % <CR>

"Para correr Java de una vez
map <leader>jj :sp<CR>:term java % <CR>

"Para correr C# de una vez
map <leader>x :sp<CR>:term dotnet run % <CR>

"EMMET CONFIGURATION 
"..................................................................................................................................
"..................................................................................................................................

let g:user_emmet_leader_key=','

"..................................................................................................................................
"..................................................................................................................................

"HTML5 PLUGGIN CONFIG 
"..................................................................................................................................
"..................................................................................................................................

"Disable event-handler attributes support:
let g:html5_event_handler_attributes_complete = 0

"Disable RDFa attributes support:
let g:html5_rdfa_attributes_complete = 0

"Disable microdata attributes support:
let g:html5_microdata_attributes_complete = 0

"Disable WAI-ARIA attribute support:
let g:html5_aria_attributes_complete = 0

"AUTOCOMPLEATO PYTHON Y JAVASCRIPT 
"..................................................................................................................................
".................................................................................................................................

" Use <c-space> to trigger completion.
"if &filetype == "javascript" || &filetype == "python"
  "inoremap <c-space> <C-x><C-u>
"else
  inoremap <silent><expr> <c-space> coc#refresh()
"endif

