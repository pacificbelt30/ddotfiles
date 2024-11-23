require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {
      'ruby',
      'toml',
      'c_sharp',
      'vue',
    }
  },
  -- ensure_installed = 'maintained',
  ensure_installed = {'lua', 'c', 'cpp', 'python', 'rust', 'go', 'javascript'},
  -- indent = { enable = true },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
require('hlargs').setup()
