local options = {
  strategies = {
    chat = {
      adapter = "my_custom_service",
    },
    inline = {
      adapter = "my_custom_service",
    },
  },

  adapters = {
    openai = function()
      return require("codecompanion.adapters").extend("openai", {
        schema = {
          model = {
            default = "gpt-4o-mini",
          },
        },
      })
    end,

    my_custom_service = function()
      return require("codecompanion.adapters").extend("openai_compatible", {
        schema = {
          model = {
            default = "gpt-4o-mini"
          }
        },
        env = {
          url = "https://api.avalai.ir",
          api_key = "aa-gbzkMh6Voq5LCjAKVqmDgESrhMnaSAs5CDHEVR449RZOkFfN",
          chat_url = "/v1/chat/completions", -- optional: default value, override if different
          model = "gpt-4o-mini",
        },
      })
    end,
  },
}

return options


--
-- require("codecompanion").setup({
--   strategies = {
--     chat = {
--       adapter = 'openai_compatible'
--     },
--     inline = {
--       adapter = 'openai_compatible'
--     },
--   },
--   adapters = {
--     openai_compatible = function()
--       return require("codecompanion.adapters").extend("openai_compatible", {
--         schema = {
--           model = {
--             default = 'gpt-4o-mini'
--           },
--         },
--         env = {
--           url = "https://api.avalai.ir", -- optional: default value is ollama url http://127.0.0.1:11434
--           api_key = "aa-gbzkMh6Voq5LCjAKVqmDgESrhMnaSAs5CDHEVR449RZOkFfN",               -- optional: if your endpoint is authenticated
--           -- chat_url = "/v1/",        -- optional: default value, override if different
--         },
--       })
--     end,
--   },
-- })
