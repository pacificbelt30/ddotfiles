--[[
外部ソフトとして必要なもの
- fzf
  - fzf.vim
- ripgrep
  - fzf.vim
- eza
- bat
  - fzf.vim
- nvm (latest node.js)
  - pyright
  - tree-sitter
- go
  - go ファイルは保存時に go fmt が実行される
--]]


-- NeoVim 自体の設定
vim.opt.runtimepath:append{os.getenv( "HOME" ) .. '/.config/nvim/plugins'}
vim.opt.runtimepath:append{os.getenv( "HOME" ) .. '/.config/nvim/rc'}
-- ~/.config/nvim/rc/lua/keymappings.lua
require("keymappings")
-- ~/.config/nvim/rc/lua/options.lua
require("options")
-- ~/.config/nvim/rc/lua/mytextobjects.lua
require("mytextobjects")
-- vim.cmd('source ' .. os.getenv( "HOME" ) .. '/.config/nvim/rc/plug.rc.vim')

-- プラグインマネージャの設定 (Lazy.nvim)
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

-- プラグインの設定
-- 何故かruntimepathから~/.config/nvim/pluginsが外れるので再定義
vim.opt.runtimepath:append{os.getenv( "HOME" ) .. '/.config/nvim/plugins'}
-- require("scrollbar").setup()
-- ~/.config/nvim/plugins/lua/other-plugins.lua
require('other-plugins')
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
-- ~/.config/nvim/plugins/lua/symbols_outline.lua
require('symbols_outline')
-- ~/.config/nvim/plugins/lua/illuminate-config.lua
require('illuminate-config')
-- ~/.config/nvim/plugins/lua/smoothie-config.lua
require('smoothie-config')
-- ~/.config/nvim/plugins/lua/autopairs-config.lua
require('autopairs-config')

-- vimscript による設定ファイル
vim.cmd('source ' .. os.getenv( "HOME" ) .. '/.config/nvim/plugins/fzf.rc.vim')
vim.cmd('source ' .. os.getenv( "HOME" ) .. '/.config/nvim/plugins/toggleterm.rc.vim')
-- vim.cmd('source ' .. os.getenv( "HOME" ) .. '/.config/nvim/plugins/easymotion.rc.vim')
--[[
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
]]

