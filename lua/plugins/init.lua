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
  -- {
  --   "kawre/leetcode.nvim",
  --   build = ":TSUpdate html",
  --   dependencies = {
  --     "nvim-telescope/telescope.nvim",
  --     "nvim-lua/plenary.nvim", -- required by telescope
  --     "MunifTanjim/nui.nvim",
  --
  --     -- optional
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   opts = {
  --     -- configuration goes here
  --   },
  -- },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = require 'configs.avante',
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick",       -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp",            -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua",            -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",      -- for providers='copilot'
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
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim",
    },
    config = function()
      require('codecompanion').setup({
        display = {
          action_palette = {
            width = 95,
            height = 10,
            prompt = "Prompt ",                   -- Prompt used for interactive LLM calls
            provider = "default",                 -- default|telescope|mini_pick
            opts = {
              show_default_actions = true,        -- Show the default actions in the action palette?
              show_default_prompt_library = true, -- Show the default prompt library in the action palette?
            },
          },
        },
        opts = {
          log_level = "DEBUG", -- or "TRACE"
        },
        adapters = {
          ollama_custom = function()
            return require("codecompanion.adapters").extend("ollama", {
              name = "ollama_custom",
              formatted_name = "Custom Ollama Interface",
              env = {
                api_key = "OLLAMA",
              },
            })
          end,
          avalai_ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              name = "avalai_ollama",
              formatted_name = "Ollama Interface (AvalAi)",
              schema = {
                model = {
                  default = "gpt-4o-mini",
                },
              },
              env = {
                url = 'https://api.avalai.ir',
                api_key = "OPENAI_API_KEY",
              },
            })
          end,
          openai_compatible_customized = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              name = "openai_compatible_customized",
              formatted_name = "Custom Endpoint OpenAI",
              schema = {
                model = {
                  default = "gpt-4o-mini",
                },
              },
              env = {
                url = 'https://api.avalai.ir',
                api_key = "OPENAI_API_KEY",
              },
            })
          end,
        },
        strategies = {
          chat = {
            adapter = "ollama_custom",
          },
          inline = {
            adapter = "ollama_custom"
          }
        },
        init = function()
          require("configs.fidget-spinner"):init()
        end
      })
    end
    -- opts = require "configs.codecompanion"
  },
  -- -- {
  --   "monkoose/neocodeium",
  --   event = "VeryLazy",
  --   config = function()
  --     local neocodeium = require("neocodeium")
  --     neocodeium.setup()
  --   end,
  -- },
  {
    'milanglacier/minuet-ai.nvim',
    lazy = false,
    config = function()
      require "configs.minuet-ai"
    end,
  },
  -- {
  --   'Saghen/blink.cmp',
  --   lazy = false,
  --   require('blink-cmp').setup {
  --     version = '*',
  --     opts = {
  --       keymap = { preset = 'super-tab' },
  --       appearance = {
  --         use_nvim_cmp_as_default = true,
  --       },
  --     },
  --
  --     keymap = {
  --       -- Manually invoke minuet completion.
  --       ['<A-m>'] = require('minuet').make_blink_map(),
  --     },
  --     sources = {
  --       -- Enable minuet for autocomplete
  --       default = { 'lsp', 'path', 'buffer', 'snippets', 'minuet' },
  --       -- For manual completion only, remove 'minuet' from default
  --       providers = {
  --         minuet = {
  --           name = 'minuet',
  --           module = 'minuet.blink',
  --           score_offset = 8, -- Gives minuet higher priority among suggestions
  --         },
  --       },
  --     },
  --     -- Recommended to avoid unnecessary request
  --     completion = { trigger = { prefetch_on_insert = false } },
  --   }
  -- },
}
