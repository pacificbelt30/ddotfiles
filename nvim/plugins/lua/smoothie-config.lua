vim.keymap.set({'n','v'},'H','<cmd>call smoothie#do("<C-u>") <CR>', {noremap = true, unique=true})
vim.keymap.set({'n','v'},'L','<cmd>call smoothie#do("<C-d>") <CR>', {noremap = true, unique=true})
