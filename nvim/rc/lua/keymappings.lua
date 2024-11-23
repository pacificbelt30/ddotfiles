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

vim.keymap.set({'n'},'<CR>','za', {noremap = true})
-- vim.keymap.set({'n'},'gb','g;', {noremap = true}) -- 変更履歴を戻る 注：変更履歴はファイル間のジャンプはなし?
-- vim.keymap.set({'n'},'gf','g.', {noremap = true}) -- 変更履歴を進める gfはカーソル下のファイルを開く
-- ジャンプ履歴を戻る 注：ジャンプ履歴はファイルを超えても飛んでいく
vim.keymap.set({'n'},'<C-b>','<C-o>', {noremap = true})
-- ジャンプ履歴を進める <C-i>から始まる何かにあたってる
vim.keymap.set({'n'},'<C-f>','<C-o>', {noremap = true})
-- vim.keymap.set({'n'},'H','<C-u>', {noremap = false})
-- vim.keymap.set({'n'},'L','<C-d>', {noremap = false})

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


