" Nvim setup file by Thep200_2021

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'mhinz/vim-startify', {'branch': 'center'}
Plug 'joshdick/onedark.vim'
Plug 'preservim/NERDTree'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug '907th/vim-auto-save'

call plug#end()

" Setup Plugin
	" vim-startify
		let g:startify_bookmarks = systemlist("cut -sd' ' -f 5- ~/.NERDTreeBookmarks")
		
	" Themes vim
		colorscheme onedark
		
	" NERDTree
		set autochdir
		let NERDTreeChDirMode=2
		let NERDTreeMinimalUI=1
		map <C-s> :NERDTreeFind<CR>
		map <C-a> :NERDTreeToggle<CR> 
		let g:NERDTreeDirArrowExpandable = '▸'
		let g:NERDTreeDirArrowCollapsible = '▾'
		autocmd BufWinEnter * silent NERDTreeMirror
		autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
			\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
			  
	" Lightline-vim
		let g:lightline = { 'colorscheme': 'onedark' }

	" Ale-vim
		let g:ale_sign_error = ' X'
		let g:ale_sign_warning = ' !'
		
	" Deoplete-vim
		let g:python3_host_prog = 'D:\Python Evns\py37\python.exe'
		let g:deoplete#enable_at_startup = 1
		autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
		inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

	" Jedi-vim
		let g:pymode_rope = 0
		let g:jedi#popup_select_first = 0
		autocmd FileType python setlocal completeopt-=preview
		
	" Vim-auto-save
		let g:auto_save = 1
		
" Setup Basic
	set number
	set showtabline=2
	set encoding=UTF-8
	set fileencodings=UTF-8
	autocmd BufRead,BufNewFile * start
	
	" Map
		nnoremap <C-z> u
		vnoremap <C-c> "*y
		inoremap xx <Esc>   """  key is <Esc> setting
	
	" Floating Windows Terminal
		function! OpenFloatTerm()
		  let height = float2nr((&lines - 2) / 1.5)
		  let row = float2nr((&lines - height) / 2)
		  let width = float2nr(&columns / 1.5)
		  let col = float2nr((&columns - width) / 2)
		  let border_opts = {
			\ 'relative': 'editor',
			\ 'row': row - 1,
			\ 'col': col - 2,
			\ 'width': width + 4,
			\ 'height': height + 2,
			\ 'style': 'minimal'
			\ }
		  let border_buf = nvim_create_buf(v:false, v:true)
		  let s:border_win = nvim_open_win(border_buf, v:true, border_opts)
		  let opts = {
			\ 'relative': 'editor',
			\ 'row': row,
			\ 'col': col,
			\ 'width': width,
			\ 'height': height,
			\ 'style': 'minimal'
			\ }
		  let buf = nvim_create_buf(v:false, v:true)
		  let win = nvim_open_win(buf, v:true, opts)
		  terminal
		  startinsert
		  autocmd TermClose * ++once :q | call nvim_win_close(s:border_win, v:true)
		endfunction

	" Fonts change
		let s:fontsize = 15
		function! AdjustFontSize(amount)
		  let s:fontsize = s:fontsize+a:amount
		  :execute "GuiFont! Consolas:h" . s:fontsize
		endfunction
		noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
		noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
		inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
		inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>
		
		
	" Bookmarks
		let g:startify_bookmarks = [
      \ '~/AppData/Local/nvim/init.vim',
      \ '~/.cache/startify_bookmarks'
      \ ]