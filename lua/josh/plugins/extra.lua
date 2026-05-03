return {
  {
    "ej-shafran/compile-mode.nvim",
    event = "VeryLazy",
    version = "^5.0.0",
    -- you can just use the latest version:
    -- branch = "latest",
    -- or the most up-to-date updates:
    -- branch = "nightly",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- if you want to enable coloring of ANSI escape codes in
      -- compilation output, add:
      -- { "m00qek/baleia.nvim", tag = "v1.3.0" },
    },
    config = function()
      ---@type CompileModeOpts
      vim.g.compile_mode = {
        -- if you use something like `nvim-cmp` or `blink.cmp` for completion,
        -- set this to fix tab completion in command mode:
        -- input_word_completion = true,

        -- to add ANSI escape code support, add:
        -- baleia_setup = true,

        -- to make `:Compile` replace special characters (e.g. `%`) in
        -- the command (and behave more like `:!`), add:
        bang_expansion = true,
        default_command = "",
      }
    end
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    enabled = false,
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ft = "markdown",
    ---@module 'render-markdown'
    ---@diagnostic disable-next-line: undefined-doc-name
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    }
  },
  {
    "chomosuke/typst-preview.nvim",
    ft = 'typst',
    version = "1.*",
    opts = {},    -- lazy.nvim will implicitly calls `setup {}`
  },
  {
    "brenoprata10/nvim-highlight-colors",
    enabled = false,
    config = function()
      require("nvim-highlight-colors").setup {
        render = "virtual",
        virtual_symbol = "󱓻",
      }
    end,
  },
  {
    "tpope/vim-sleuth",
  },
  {
    "windwp/nvim-autopairs",
    enabled = false,
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    "j-hui/fidget.nvim",
    enabled = false,
    opts = {
      notification = {
        window = {
          winblend = 0,
        },
      },
    },
  },
}
