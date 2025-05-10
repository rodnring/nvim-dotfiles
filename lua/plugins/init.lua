return {
  { import = "nvchad.blink.lazyspec" },
  {
    "saghen/blink.cmp",
    dependencies = {
      "Kaiser-Yang/blink-cmp-avante",
      -- ... Other dependencies
    },
    opts = {
      sources = {
        -- Add 'avante' to the list
        default = { "avante", "lsp", "path", "snippets", "buffer" },
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
            opts = {
              completion = {
                autocomplete = { "Insert", "TextChanged" },
                keyword_length = 2,
              },
              mapping = {
                ["<C-n>"] = "next_item",
                ["<C-p>"] = "prev_item",
              },
              sources = {
                { name = "buffer" },
                { name = "nvim_lsp" },
                { name = "path" },
              },
            },
          },
        },
      },
    },
  },
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
    "tveskag/nvim-blame-line",
  },
  {
    "NeogitOrg/neogit",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
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
          require("which-key").show { global = false }
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "tsx",
        "jsdoc",
        "json",
        "json5",
        "scss",
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
  { "akinsho/git-conflict.nvim", version = "*", config = true },
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
    {
      "yetone/avante.nvim",
      event = "VeryLazy",
      lazy = false,
      version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
      opts = require "configs.avante",
      -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
      build = "make",
      -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
      dependencies = {
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "echasnovski/mini.pick", -- for file_selector provider mini.pick
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
        "ibhagwan/fzf-lua", -- for file_selector provider fzf
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua", -- for providers='copilot'
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
          "MeanderingProgrammer/render-markdown.nvim",
          opts = {
            file_types = { "markdown", "Avante" },
          },
          ft = { "markdown", "Avante" },
        },
      },
    },
    {
      "github/copilot.vim",
    },
    {
      "mattn/emmet-vim",
      lazy = false,
    },
    {
      "gennaro-tedesco/nvim-possession",
      dependencies = {
        "ibhagwan/fzf-lua",
      },
      config = true,
      keys = {
        {
          "<leader>sl",
          function()
            require("nvim-possession").list()
          end,
          desc = "📌list sessions",
        },
        {
          "<leader>sn",
          function()
            require("nvim-possession").new()
          end,
          desc = "📌create new session",
        },
        {
          "<leader>su",
          function()
            require("nvim-possession").update()
          end,
          desc = "📌update current session",
        },
        {
          "<leader>sd",
          function()
            require("nvim-possession").delete()
          end,
          desc = "📌delete selected session",
        },
      },
    },
    {
      "milanglacier/minuet-ai.nvim",
      lazy = false,
      config = function()
        require "configs.minuet-ai"
      end,
    },
    {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
        {
          "<leader>dx",
          "<cmd>Trouble diagnostics toggle<cr>",
          desc = "Diagnostics (Trouble)",
        },
        {
          "<leader>dX",
          "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          "<leader>cs",
          "<cmd>Trouble symbols toggle focus=false<cr>",
          desc = "Symbols (Trouble)",
        },
        {
          "<leader>cl",
          "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
          desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
          "<leader>dL",
          "<cmd>Trouble loclist toggle<cr>",
          desc = "Location List (Trouble)",
        },
        {
          "<leader>dQ",
          "<cmd>Trouble qflist toggle<cr>",
          desc = "Quickfix List (Trouble)",
        },
      },
    },
    {
      "ravitemer/mcphub.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
      },
      -- comment the following line to ensure hub will be ready at the earliest
      cmd = "MCPHub", -- lazy load by default
      build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
      -- uncomment this if you don't want mcp-hub to be available globally or can't use -g
      -- build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
      config = function()
        require("mcphub").setup()
      end,
    },
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
      "m4xshen/hardtime.nvim",
      dependencies = { "MunifTanjim/nui.nvim" },
      opts = {},
    },
    {
      "rachartier/tiny-code-action.nvim",
      dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope.nvim" },
      },
      event = "LspAttach",
      config = function()
        require("tiny-code-action").setup()
      end,
    },
  },
}
