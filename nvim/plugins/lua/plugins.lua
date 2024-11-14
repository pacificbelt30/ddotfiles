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
  {
    'Shougo/denite.nvim',
    lazy = false,
    priority = 1000,
    build = ':UpdateRemotePlugins'
  },
  -- ファイルタイプを取得する
  {
    'Shougo/context_filetype.vim',
    lazy = false,
    priority = 1000,
  },
  -- コメントアウト
  {
    'pacificbelt30/easyCO.vim',
    lazy = false,
    priority = 1000,
  },
  -- アスタリスク拡張
  {
    'pacificbelt30/exasterisk.vim',
    lazy = false,
    priority = 1000,
  },
  -- powerline的なやつ lualineへの移行も検討
  -- =======================================
  {
    'vim-airline/vim-airline',
    lazy = false,
    priority = 1000,
  },
  {
    'vim-airline/vim-airline-themes',
    lazy = false,
    priority = 1000,
  },
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

  -- easymotion or leap
  {
    'easymotion/vim-easymotion',
    lazy = false,
    priority = 1000,
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
  {
    'junegunn/goyo.vim',
    lazy = false,
    priority = 1000,
  },

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

  -- sunippets
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
  {
    'Yggdroot/indentLine',
    lazy = false,
    priority = 1000,
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

  -- toggle出来る端末をはやせる
  {
    'akinsho/toggleterm.nvim',
    lazy = false,
    priority = 1000,
  },

  -- colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end
  },
}
