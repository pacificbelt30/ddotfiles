vim.opt.runtimepath:append{os.getenv( "HOME" ) .. '/.config/nvim/plugins'}
-- vim.cmd('source ' .. os.getenv( "HOME" ) .. '/.config/nvim/rc/plug.rc.vim')
print('init.lua')
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
-- vim.opt.cursorcolumn = true
vim.opt.virtualedit = 'onemore'
-- ビープ音を可視化
-- vim.opt.visualbell = true
-- 対応する括弧を光らせる
vim.opt.showmatch = true
-- ステータスラインを常に表示
vim.opt.laststatus = 3
-- tagsファイルを見る
vim.opt.tags = '.tags'

-- Tab系
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
-- colorscheme tender
-- colorscheme jellybeans
-- colorscheme onedark
-- colorscheme badwolf
-- colorscheme molokai
-- vim.cmd [[colorscheme gruvbox]]
-- これも無いらしい
-- vim.opt.t_Co = 256
vim.opt.termguicolors = true
-- コマンドラインの高さが0になる
vim.opt.cmdheight = 0
vim.opt.pumblend = 20
vim.opt.winblend = 10

-- foldmethod
vim.opt.foldmethod = 'indent'
vim.opt.foldnestmax = 1
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
  -- :e ~/.config/nvim/init.vim
  vim.cmd ':e ~/dotfiles/nvim/init.vim'
  vim.cmd ':cd %:h'
end
vim.api.nvim_create_user_command('OC', OpenConf, {bang = true})


-- vim.keymap.set({},'','', {noremap = true})
-- 割り当て方として 連打したくなるようなやつ -> <C,Shift,Alt>+α , そうじゃないやつ -> [a-z,A-Z].*
vim.g.mapleader = ' '
vim.keymap.set({'i','t'}, 'jk','<C-\\><C-n>', {noremap = true, silent = true})
vim.keymap.set({'n'},'p','p`]', {noremap = true, silent = true})

vim.keymap.set({'n'},'<Esc><Esc>','<cmd>nohlsearch<CR><Esc>')

vim.keymap.set({'n'},'<C-j>','<cmd>bprev<CR>', {noremap = true, silent = true})
vim.keymap.set({'n'},'<C-k>','<cmd>bnext<CR>', {noremap = true, silent = true})
vim.keymap.set({'t'},'<Esc>','<C-\\><C-n>', {noremap = true})
vim.keymap.set({'t'},'<a>','<i>', {noremap = true})

vim.keymap.set({'n'},'j','gj', {noremap = true})
vim.keymap.set({'n'},'k','gk', {noremap = true})
vim.keymap.set({'v'},'j','gj', {noremap = true})
vim.keymap.set({'v'},'k','gk', {noremap = true})

-- ウィンドウ移動
-- nnoremap <C-w> :wincmd w<CR>
vim.keymap.set({'n'},'w','<cmd>wincmd w<CR>', {noremap = true})

vim.keymap.set({'n'},'<leader>w',':w<CR>', {noremap = true})
vim.keymap.set({'n'},'<leader>q',':q<CR>', {noremap = true})
vim.keymap.set({'n'},'<leader>V',':vs<CR>', {noremap = true})
vim.keymap.set({'n'},'<leader><CR>',':only<CR>', {noremap = true})
vim.keymap.set({'n'},'<leader>H',':sp<CR>', {noremap = true})
vim.keymap.set({'n'},'<leader>t',':tabnew <CR>', {noremap = true})

-- nnoremap <leader><CR> :tabclose <CR>
-- nnoremap <leader>b :b  
vim.keymap.set({'n'},'<leader>e','<cmd>e--', {noremap = true})
vim.keymap.set({'n'},'<Tab><Tab>','q:', {noremap = true})


-- visualmodeでvを押すとカーソル以下の単語選択
vim.keymap.set({'v'},'v','iw', {noremap = true})

-- vim.keymap.set({'n'},'<leader>n',':Ex.<CR>', {noremap = true})
-- vim.keymap.set({'n'},'bb','<cmd>b#<CR>', {noremap = true, silent = true})
-- vim.keymap.set({'n'},'bd','<cmd>bd<CR>', {noremap = true, silent = true})

-- スペース二回でコマンドラインの入力消去 (ctrl+uのショートカットが有効の場合)
vim.keymap.set({'t','c'},'<Space><Space>','<C-u>', {noremap = true})

-- オペレータ待機
vim.keymap.set({'o'},'8','i(', {noremap = true})
vim.keymap.set({'o'},'2','i"', {noremap = true})
vim.keymap.set({'o'},'7','i\'', {noremap = true})
vim.keymap.set({'o'},'@','i`', {noremap = true})
vim.keymap.set({'o'},'[','i[', {noremap = true})
vim.keymap.set({'o'},'{','i{', {noremap = true})
vim.keymap.set({'o'},',','i<', {noremap = true})
vim.keymap.set({'n'},';',':', {noremap = true})
-- vim.keymap.set({'n'},':',';', {noremap = true})

vim.keymap.set({'n'},'<CR>','<Nop>', {noremap = false})

-- ノーマルモードでエンターを押すと改行できる
vim.keymap.set({'n'},'<CR>','o<Esc>', {noremap = true})
vim.keymap.set({'n'},'<CR>','za', {noremap = true})
-- vim.keymap.set({'n'},'gb','g;', {noremap = true}) -- 変更履歴を戻る 注：変更履歴はファイル間のジャンプはなし?
-- vim.keymap.set({'n'},'gf','g.', {noremap = true}) -- 変更履歴を進める gfはカーソル下のファイルを開く
-- ジャンプ履歴を戻る 注：ジャンプ履歴はファイルを超えても飛んでいく
vim.keymap.set({'n'},'<C-b>','<C-o>', {noremap = true})
-- ジャンプ履歴を進める <C-i>から始まる何かにあたってる
vim.keymap.set({'n'},'<C-f>','<C-o>', {noremap = true})
-- vim.keymap.set({'n'},'H','<C-u>', {noremap = false})
-- vim.keymap.set({'n'},'L','<C-d>', {noremap = false})

-- vim.keymap.set({'i'},'{<Enter>','{}<Left><CR><ESC><S-o>', {noremap = true})
-- vim.keymap.set({'i'},'[<Enter>','[]<Left><CR><ESC><S-o>', {noremap = true})
-- vim.keymap.set({'i'},'(<Enter>','()<Left><CR><ESC><S-o>', {noremap = true})

-- カレントディレクトリ変更
-- <C-p>はkと同じ
-- バッファまるごと開いてるファイルのディレクトリへ
vim.keymap.set({'n'},'<C-p>','<Nop>', {noremap = false})
vim.keymap.set({'n'},'<C-p>','<cmd>cd:%:h', {noremap = true})
-- 現在のバッファのみディレクトリを変更
vim.keymap.set({'n'},'<C-p>','<cmd>lcd:%:h', {noremap = true})

-- インサートモードでjを打ったときの待ち時間を短縮(ターミナル，コマンドライン入力も)
vim.api.nvim_create_augroup('timeout', {})
vim.api.nvim_create_autocmd({'InsertEnter', 'TermEnter', 'CmdlineEnter'}, {
  group = 'timeout',
  pattern = '*',
  command = 'set timeoutlen=300',
})
vim.api.nvim_create_autocmd({'InsertLeave', 'TermLeave', 'CmdlineLeave'}, {
  group = 'timeout',
  pattern = '*',
  command = 'set timeoutlen=1000',
})


-- mytextobject
-- vim-textobj-userを用いた自分用テキストオブジェクト定義
-- vim.cmd [[
-- call textobj#user#plugin('tex', {
-- \   'environment': {
-- \     'pattern': ['\\begin{.*}.*\n', '\\end{.*}'],
-- \     'select-a': 'ae',
-- \     'select-i': 'ie',
-- \   },
-- \ })
-- ]]


-- plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ~/.config/nvim/plugins/lua/plugins.lua
plugins = require('plugins')
-- ~/.config/nvim/plugins/lua/opts.lua
opts = require('opts')

require("lazy").setup(plugins, opts)

-- config
-- 何故かruntimepathから~/.config/nvim/pluginsが外れるので再定義
vim.opt.runtimepath:append{os.getenv( "HOME" ) .. '/.config/nvim/plugins'}
require("scrollbar").setup()
-- ~/.config/nvim/plugins/lua/luaoptions.lua
require('luaoptions')
-- ~/.config/nvim/plugins/lua/nvim-cmp.lua
require('nvim-cmp')
-- ~/.config/nvim/plugins/lua/tree-sitter.lua
require('tree-sitter')
-- ~/.config/nvim/plugins/lua/hop-easymotion.lua
require('hop-easymotion')
-- ~/.config/nvim/plugins/lua/comment-nvim.lua
require('comment-nvim')
-- ~/.config/nvim/plugins/lua/lualine-confing.lua
require('lualine-config')

-- vim.cmd('source ' .. os.getenv( "HOME" ) .. '/.config/nvim/plugins/airline.rc.vim')
vim.cmd('source ' .. os.getenv( "HOME" ) .. '/.config/nvim/plugins/tagbar.rc.vim')
-- vim.cmd('source ' .. os.getenv( "HOME" ) .. '/.config/nvim/plugins/denite.rc.vim')
-- vim.cmd('source ' .. os.getenv( "HOME" ) .. '/.config/nvim/plugins/easymotion.rc.vim')
-- vim.cmd('source ' .. os.getenv( "HOME" ) .. '/.config/nvim/plugins/tree-sitter.rc.vim')
vim.cmd('source ' .. os.getenv( "HOME" ) .. '/.config/nvim/plugins/fzf.rc.vim')
vim.cmd('source ' .. os.getenv( "HOME" ) .. '/.config/nvim/plugins/lexima.rc.vim')
-- vim.cmd('source ' .. os.getenv( "HOME" ) .. '/.config/nvim/plugins/indentLine.rc.vim')
vim.cmd('source ' .. os.getenv( "HOME" ) .. '/.config/nvim/plugins/toggleterm.rc.vim')
--[[
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
]]

vim.keymap.set({'n','v'},'H','<cmd>call smoothie#do("<C-u>") <CR>', {noremap = true, unique=true})
vim.keymap.set({'n','v'},'L','<cmd>call smoothie#do("<C-d>") <CR>', {noremap = true, unique=true})
-- vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})

-- default configuration
require('illuminate').configure({
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    -- delay: delay in milliseconds
    delay = 100,
    -- filetype_overrides: filetype specific overrides.
    -- The keys are strings to represent the filetype while the values are tables that
    -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
    filetype_overrides = {},
    -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
    filetypes_denylist = {
        'dirvish',
        'fugitive',
    },
    -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
    filetypes_allowlist = {},
    -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
    -- See `:help mode()` for possible values
    modes_denylist = {},
    -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
    -- See `:help mode()` for possible values
    modes_allowlist = {},
    -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_denylist = {},
    -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_allowlist = {},
    -- under_cursor: whether or not to illuminate under the cursor
    under_cursor = true,
    -- large_file_cutoff: number of lines at which to use large_file_config
    -- The `under_cursor` option is disabled when this cutoff is hit
    large_file_cutoff = nil,
    -- large_file_config: config to use for large files (based on large_file_cutoff).
    -- Supports the same keys passed to .configure
    -- If nil, vim-illuminate will be disabled for large files.
    large_file_overrides = nil,
    -- min_count_to_highlight: minimum number of matches required to perform highlighting
    min_count_to_highlight = 1,
})

vim.api.nvim_create_augroup('illuminate_augroup', {})
vim.api.nvim_create_autocmd({'VimEnter'}, {
  group = 'illuminate_augroup',
  pattern = '*',
  command = 'hi link illuminatedWord CursorLine',
})

-- symbols-outlineのconfig
local opts = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = false,
  position = 'right',
  relative_width = true,
  width = 25,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = 'Pmenu',
  autofold_depth = nil,
  auto_unfold_hover = true,
  fold_markers = { '', '' },
  wrap = false,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = {"<Esc>", "q"},
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
  symbols = {
    File = { icon = "", hl = "@text.uri" },
    Module = { icon = "", hl = "@namespace" },
    Namespace = { icon = "", hl = "@namespace" },
    Package = { icon = "", hl = "@namespace" },
    Class = { icon = "𝓒", hl = "@type" },
    Method = { icon = "ƒ", hl = "@method" },
    Property = { icon = "", hl = "@method" },
    Field = { icon = "", hl = "@field" },
    Constructor = { icon = "", hl = "@constructor" },
    Enum = { icon = "ℰ", hl = "@type" },
    Interface = { icon = "ﰮ", hl = "@type" },
    Function = { icon = "", hl = "@function" },
    Variable = { icon = "", hl = "@constant" },
    Constant = { icon = "", hl = "@constant" },
    String = { icon = "𝓐", hl = "@string" },
    Number = { icon = "#", hl = "@number" },
    Boolean = { icon = "⊨", hl = "@boolean" },
    Array = { icon = "", hl = "@constant" },
    Object = { icon = "⦿", hl = "@type" },
    Key = { icon = "🔐", hl = "@type" },
    Null = { icon = "NULL", hl = "@type" },
    EnumMember = { icon = "", hl = "@field" },
    Struct = { icon = "𝓢", hl = "@type" },
    Event = { icon = "🗲", hl = "@type" },
    Operator = { icon = "+", hl = "@operator" },
    TypeParameter = { icon = "𝙏", hl = "@parameter" },
    Component = { icon = "", hl = "@function" },
    Fragment = { icon = "", hl = "@constant" },
  },
}
require('symbols-outline').setup(opts)
vim.keymap.set({'n'},'<F12>','<cmd>SymbolsOutline<CR>', {noremap = true})
vim.api.nvim_create_augroup('SymbolsOutline_augroup', {})
--[[
vim.api.nvim_create_autocmd({'FileType', 'VimEnter'}, {
  group = 'SymbolsOutline_augroup',
  pattern = {'c','cpp'},
  callback = function()
    vim.cmd 'SymbolsOutlineOpen'
  end,
})
]]
