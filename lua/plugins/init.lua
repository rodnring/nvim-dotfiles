return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "ggandor/lightspeed.nvim",
    lazy = false,
  },
  {
    "tveskag/nvim-blame-line"
  },
  {
    "NeogitOrg/neogit",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "tsx", "jsdoc",
        "json", "json5", "scss"
      },
    },
  },
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup()
    end,
  },
  { 'akinsho/git-conflict.nvim', version = "*", config = true },
  {
    "folke/twilight.nvim",
    lazy = false,
    opts = {},
  },
  {
    "folke/zen-mode.nvim",
    lazy = false,
    opts = {},
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- configuration goes here
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      provider = "ollama",
      vendors = {
        ollama = {
          __inherited_from = "openai",
          endpoint = 'http://127.0.0.1:11434/v1',
          model = 'qwen2.5-coder:7b',
        }
      },
      auto_suggestions_provider = "ollama",

      -- provider = "ollama",
      -- vendors = {
      --   ollama = {
      --     __inherited_from = "openai",
      --     endpoint = 'http://127.0.0.1:11434/v1',
      --     model = 'deepseek-r1:14b',
      --   }
      -- },
      -- provider = "openai",
      -- openai = {
      --   endpoint = 'https://api.avalai.ir/v1',
      --   model = 'gpt-4o-mini-2024-07-18',
      -- },
      -- auto_suggestions_provider = "openai",
      -- add any opts here
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick",         -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua",              -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",        -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     local codecompanion = require("codecompanion")
  --     codecompanion.setup({
  --       strategies = {
  --         chat = {
  --           adapter = 'openai'
  --         },
  --         inline = {
  --           adapter = 'openai'
  --         },
  --       },
  --       adapters = {
  --         openai = function()
  --           return require("codecompanion.adapters").extend("openai_compatible", {
  --             env = {
  --               url = "https://api.avalai.ir/v1",                                -- optional: default value is ollama url http://127.0.0.1:11434
  --               api_key = "aa-gbzkMh6Voq5LCjAKVqmDgESrhMnaSAs5CDHEVR449RZOkFfN", -- optional: if your endpoint is authenticated
  --             },
  --           })
  --         end,
  --       },
  --     })
  --   end
  -- },
  -- {
  --   "monkoose/neocodeium",
  --   event = "VeryLazy",
  --   config = function()
  --     local neocodeium = require("neocodeium")
  --     neocodeium.setup()
  --   end,
  -- }
}
