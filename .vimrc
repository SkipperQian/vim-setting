set number
set mouse=a
set noswapfile
set hls

set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix
"set encoding=prc
set encoding=utf-8
syntax enable
syntax on

"set guifont=Monospace\ Bold\ 9

"if has('gui_running')
"	set background=light
"	colorscheme solarized
"	let g:solarized_termcolors= 256
"else
"	set background=dark
"	let g:detorte_theme_mode = 'dark'
"	colorscheme detorte
"	hi CursorLine   term=NONE cterm=NONE ctermbg=240 gui=none guibg=#585858
"	hi CursorLineNr term=bold cterm=bold ctermfg=226 gui=bold guifg=#ffff00
"endif

colorscheme onedark
let g:onedark_termcolors=256

set ruler
set cursorline
"hi CursorLineNr term=bold cterm=bold ctermfg=226 gui=bold guifg=#ffff00
set showcmd
set cmdheight=2
set laststatus=2


filetype plugin indent on
set smartindent
set ai
set cindent
"autocmd FileType makefile set shiftwidth=8 |set tabstop=8 | set cindent
autocmd FileType java,xml,python set shiftwidth=4 |set tabstop=4 | set expandtab


set autoread
set completeopt-=preview
set clipboard+=unamed

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" plugin set

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'skywind3000/quickmenu.vim'
Plug 'skywind3000/gutentags_plus'
Plug 'fholgado/minibufexpl.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-scripts/taglist.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'vim-scripts/TagHighlight'
Plug 'tamlok/detorte'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'MattesGroeger/vim-bookmarks'
Plug 'easymotion/vim-easymotion'

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/deoplete-clangx'

" 延迟按需加载，使用到命令的时候再加载或者打开对应文件类型才加载
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"Plug 'Valloric/YouCompleteMe'

Plug 'skywind3000/vim-preview'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

noremap <C-]> g<C-]>
"set tags=./tags;/

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
"let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

let g:gutentags_ctags_exclude = [ '*/alpha/*',
				\ '*/avr32/*',
				\ '*/c6x/*',
				\ '*/frv/*',
				\ '*/ia64/*',
				\ '*/m32r/*',
				\ '*/metag/*',
				\ '*/mips/*',
				\ '*/nios2/*',
				\ '*/parisc/*',
				\ '*/s390/*',
				\ '*/sh/*',
				\ '*/tile/*',
				\ '*/unicore32/*',
				\ '*/xtensa/*',
				\ '*/arc/*',
				\ '*/blackfin/*',
				\ '*/cris/*',
				\ '*/hexagon/*',
				\ '*/Kconfig/*',
				\ '*/m68k/*',
				\ '*/microblaze/*',
				\ '*/mn10300/*',
				\ '*/openrisc/*',
				\ '*/powerpc/*', 
				\ '*/score/*',
				\ '*/sparc/*',
				\ '*/um/*',
				\ '*/x86/*']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

"let g:ycm_global_ycm_extra_conf='~/work/linux-4.0/.ycm_extra_conf.py'
"let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_server_log_level = 'debug'
"let g:ycm_min_num_identifier_candidate_chars = 2
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_complete_in_strings=1
"let g:ycm_key_invoke_completion = '<c-z>'
"set completeopt=menu,menuone

"noremap <c-z> <NOP>

"let g:ycm_semantic_triggers =  {
"           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
"           \ 'cs,lua,javascript': ['re!\w{2}'],
"           \ }
"let g:ycm_filetype_whitelist = { 
"			\ "c":1,
"			\ "cpp":1, 
"			\ }

nmap <F9> :TlistToggle<CR>
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1

"nmap <F8> :SrcExplToggle<CR>
"let g:SrcExpl_winHeight = 8
"let g:SrcExpl_refreshTime = 100
"let g:SrcExpl_jumpKey = "<ENTER>"
"let g:SrcExpl_gobackKey = "<SPACE>"
"let g:SrcExpl_isUpdateTags = 0


let NERDTreeWinPos = "left"
nmap <F7> :NERDTreeToggle<CR>

let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
nmap <F8> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_MruFileExclude = ['*.so','*.exe','*.beam','*.log', '*.o', '*.a']

nmap <F4> :grep -rn --include=*.[ch] <cword> . <cr>
noremap <silent> <F5> :bp<CR>
noremap <silent> <F6> :bn<CR>

autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>


" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute '%s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

