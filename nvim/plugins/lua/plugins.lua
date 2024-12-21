return {
  {
    'scrooloose/nerdtree',
    lazy = false,
    priority = 1000,
  },
  -- 置換
  {
    'kana/vim-operator-user',
    lazy = false,
    priority = 1000,
    dependencies = {
      'kana/vim-textobj-user',
      'kana/vim-operator-replace',
    }
  },
  { 'kana/vim-operator-replace', },
  -- textobj
  { 'kana/vim-textobj-user', },
  -- 括弧補完
  --[[{
    'cohama/lexima.vim',
    lazy = false,
    priority = 1000,
  },]]
  {
    'windwp/nvim-autopairs',
    lazy = false,
    priority = 1000,
  },
  -- 色々出来るけど，バッファ切り替え用
  -- {
  --   'Shougo/denite.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   build = ':UpdateRemotePlugins'
  -- },
  -- ファイルタイプを取得する
  {
    'Shougo/context_filetype.vim',
    lazy = false,
    priority = 1000,
  },
  -- コメントアウト
  -- {
  --   'pacificbelt30/easyCO.vim',
  --   lazy = false,
  --   priority = 1000,
  -- },
  {
    'numToStr/Comment.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  -- アスタリスク拡張
  {
    'pacificbelt30/exasterisk.vim',
    lazy = false,
    priority = 1000,
  },
  -- powerline的なやつ lualineへの移行
  -- =======================================
  -- {
  --   'vim-airline/vim-airline',
  --   lazy = false,
  --   priority = 1000,
  -- },
  -- {
  --   'vim-airline/vim-airline-themes',
  --   lazy = false,
  --   priority = 1000,
  -- },
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'kyazdani42/nvim-web-devicons',
    lazy = false,
    priority = 1000,
  },
  -- アイコン
  {
    'ryanoasis/vim-devicons',
    lazy = false,
    priority = 1000,
  },
  -- =======================================

  -- git関連
  -- =======================================
  -- git操作
  {
    'tpope/vim-fugitive',
    lazy = false,
    priority = 1000,
  },
  -- 変更箇所にマーク
  {
    'airblade/vim-gitgutter',
    lazy = false,
    priority = 1000,
  },
  -- Diff の表示
  {
    'sindrets/diffview.nvim',
    lazy = false,
    priority = 1000,
  },
  -- =======================================

  -- lsp
  -- =======================================
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    priority = 1000,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'hrsh7th/nvim-cmp',
    lazy = true,
    priority = 1000,
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'kdheepak/cmp-latex-symbols',
      'quangnguyen30192/cmp-nvim-ultisnips',
    },
  },
  { 'hrsh7th/cmp-nvim-lsp', },
  { 'hrsh7th/cmp-buffer', },
  { 'hrsh7th/cmp-path', },
  { 'hrsh7th/cmp-cmdline', },
  { 'hrsh7th/cmp-nvim-lsp-signature-help', },
  { 'hrsh7th/cmp-nvim-lua', },
  { 'kdheepak/cmp-latex-symbols', },
  { 'tzachar/cmp-ai', dependencies = 'nvim-lua/plenary.nvim'},
  { 'milanglacier/minuet-ai.nvim', dependencies = 'nvim-lua/plenary.nvim'},
  { 'zbirenbaum/copilot.lua' },
  { "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  },

  -- snippets
  {
    'SirVer/ultisnips',
    lazy = false,
    priority = 1000,
  },
  { 'quangnguyen30192/cmp-nvim-ultisnips', },
  -- =======================================
  --tagbarのlsp対応版
  {
    'simrat39/symbols-outline.nvim',
    lazy = false,
    priority = 1000,
  },

  --tresitter
  -- =======================================
  {
    'nvim-treesitter/nvim-treesitter',
    event = {'BufNewFile', 'BufRead'},
    lazy = true,
    priority = 1000,
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
      'p00f/nvim-ts-rainbow',
      -- 'haringsrob/nvim_context_vt',
      'm-demare/hlargs.nvim',
    }
  },
  -- 親となるクラスや関数を上部に表示
  { 'nvim-treesitter/nvim-treesitter-context', },
  -- 括弧をレインボーに
  { 'p00f/nvim-ts-rainbow', },
  -- クラスや関数の詳細を下部に表示
  -- { 'haringsrob/nvim_context_vt', }, -- エラーが解決できない
  -- 引数を別色で色付け
  { 'm-demare/hlargs.nvim', },
  -- =======================================
  -- 折りたたみ箇所の見た目を変更
  {
    'lambdalisue/readablefold.vim',
    lazy = false,
    priority = 1000,
  },

  -- easymotion or leap or hop
  -- {
  --   'easymotion/vim-easymotion',
  --   lazy = false,
  --   priority = 1000,
  -- },
  {
    'smoka7/hop.nvim',
    version = "*",
    opts = {
        keys = 'etovxqpdygfblzhckisuran'
    }
  },

  -- document日本語化
  {
    'vim-jp/vimdoc-ja',
    lazy = false,
    priority = 1000,
  },

  -- ドットリピートが強くなる
  {
    'tpope/vim-repeat',
    lazy = false,
    priority = 1000,
  },

  -- 禅モード
  -- {
  --   'junegunn/goyo.vim',
  --   lazy = false,
  --   priority = 1000,
  -- },

  -- C-eでリサイズモード
  {
    'simeji/winresizer',
    lazy = false,
    priority = 1000,
  },

  -- プラグインのヘルプテンプレート作成用
  {
    'LeafCage/vimhelpgenerator',
    lazy = false,
    priority = 1000,
  },

  -- snippets
  {
    'honza/vim-snippets',
    lazy = false,
    priority = 1000,
  },

  -- ファジーファインダー
  -- =======================================
  --[[
  {
    'nvim-lua/plenary.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    priority = 1000,
  },
  ]]
  {
    'junegunn/fzf',
    lazy = false,
    priority = 1000,
  },
  {
    'junegunn/fzf.vim',
    lazy = false,
    priority = 1000,
  },
  --[[ {
    "ibhagwan/fzf-lua",
    lazy = true,
    priority = 1000,
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  }, ]]
  -- =======================================

  -- undo tree
  {
    'mbbill/undotree',
    lazy = false,
    priority = 1000,
  },

  -- スクロールバーがちょっとわかりやすくなる
  {
    'petertriho/nvim-scrollbar',
    lazy = false,
    priority = 1000,
    config = function()
      require('scrollbar').setup()
    end
  },

  -- スムーズスクロール
  {
    'psliwka/vim-smoothie',
    lazy = false,
    priority = 1000,
  },

  -- インデントを視覚的にわかりやすくする
  -- {
  --   'Yggdroot/indentLine',
  --   lazy = false,
  --   priority = 1000,
  -- },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },

  -- カーソル下と同じ単語をアンダーライン or 色付け
  {
    'itchyny/vim-cursorword',
    lazy = false,
    priority = 1000,
  },
  {
    'RRethy/vim-illuminate',
    lazy = false,
    priority = 1000,
  },

  -- 通知
  {
    'rcarriga/nvim-notify',
    lazy = false,
    priority = 1000,
  },
  -- 通知
  {
    'MunifTanjim/nui.nvim',
    lazy = false,
    priority = 1000,
  },
  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
  },
  -- toggle出来る端末をはやせる
  {
    'akinsho/toggleterm.nvim',
    lazy = false,
    priority = 1000,
  },

  -- colorscheme
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd([[colorscheme tokyonight-storm]])
    end
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd([[colorscheme kanagawa-wave]])
    end
  },
}
