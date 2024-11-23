-- 文字コードをUTF-8に設定
vim.opt.fenc = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- 改行コードの判別
vim.opt.fileformat = 'unix'
-- 何故かオプションが無いらしい
vim.opt.backup = false
vim.opt.swapfile = false
-- 他の場所で上書きされたとき自動で読む
vim.opt.autoread = true
-- 保存してなくてもバッファに隠せる
vim.opt.hidden = true
-- コマンドが見える
vim.opt.showcmd = true

-- コマンドの補完
vim.opt.wildmenu = true 
vim.opt.wildmode = 'full'
vim.opt.history = 5000 

-- 見た目系
vim.opt.number = true
-- 現在の行を強調表示
vim.opt.cursorline = true
-- 現在の行を強調表示（縦）
vim.opt.cursorcolumn = true
vim.opt.virtualedit = 'onemore'
-- ビープ音を可視化
vim.opt.visualbell = true
-- 対応する括弧を光らせる
vim.opt.showmatch = true
-- ステータスラインを常に表示
vim.opt.laststatus = 3
-- tagsファイルを見る
vim.opt.tags = '.tags'

-- Tab系 (各言語固有の設定は ftplugins/ 以下に記述する)
vim.opt.list = true
-- vim.opt.listchars = 'tab:\▸\-'
vim.opt.listchars:append {
	tab = "▸-",
	multispace = space,
	lead = space,
	trail = space,
	nbsp = space
}
vim.opt.expandtab = true
-- vim.opt.tabstop = 4
vim.opt.tabstop = 2
-- vim.opt.shiftwidth = 4
vim.opt.shiftwidth = 2

-- 大文字小文字区別なし
vim.opt.ignorecase = true
-- 大文字のときのみ区別あり
vim.opt.smartcase = true
-- 1文字うつと検索開始
vim.opt.incsearch = true
vim.opt.wrapscan = true
-- 検索文字のハイライト
vim.opt.hlsearch = true
-- vim.opt.nohlsearch = true
vim.opt.inccommand = 'nosplit'
-- 残りn行でスクロール開始
vim.opt.scrolloff = 5

-- 全角スペース表示設定
vim.cmd 'highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666'
-- vim.cmd と commandは同じ？
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = '*',
  command = 'match ZenkakuSpace /　/'
})

-- vim.opt.smartindent = true
-- vim.opt.autoindent = true
-- vim.opt.cindent = true
-- vim.opt.clipboard = unnamed
vim.opt.clipboard:append{'unnamedplus'}

-- 背景透過 transparent
vim.api.nvim_create_augroup('TransparentBG', {})
vim.api.nvim_create_autocmd('colorscheme', {
  group = 'TransparentBG',
  pattern = '*',
  callback = function()
    vim.cmd 'highlight NonText ctermbg=none guibg=none'
  end,
})
vim.api.nvim_create_autocmd('colorscheme', {
  group = 'TransparentBG',
  pattern = '*',
  callback = function()
    vim.cmd 'highlight Folded ctermbg=none guibg=none'
  end,
})

-- colorscheme"
vim.cmd 'syntax enable'
vim.opt.background = 'dark'
vim.opt.termguicolors = true
-- コマンドラインの高さが0になる
vim.opt.cmdheight = 0
vim.opt.pumblend = 20
vim.opt.winblend = 10

-- foldmethod
vim.opt.foldmethod = 'indent'
vim.opt.foldnestmax = 1
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.api.nvim_create_autocmd('FileType', {
  -- group = 'TransparentBG',
  pattern = 'Outline',
  callback = function()
    vim.cmd 'setlocal foldmethod=marker foldcolumn=3'
  end,
})
-- autocmd FileType c setlocal foldmethod=marker foldcolumn=3
-- autocmd FileType cpp setlocal foldmethod=marker foldcolumn=3

-- help 日本語化
vim.opt.helplang = 'ja'

-- ファイルタイプを識別する
vim.cmd 'filetype on'
vim.cmd 'filetype plugin on'
vim.cmd 'filetype indent on'
vim.g.tex_flavor = 'latex' -- 全.texファイルをlatexファイルとして認識させる

-- undo 永続化
vim.opt.undodir = os.getenv( "HOME" ) .. '/.vim/undo'
vim.opt.undofile = true

-- 設定ファイルを開くコマンド及び関数
function OpenConf()
  -- :e ~/.config/nvim/init.lua
  vim.cmd ':e ~/.config/nvim/init.lua'
  vim.cmd ':cd %:h'
end
vim.api.nvim_create_user_command('OC', OpenConf, {bang = true})


