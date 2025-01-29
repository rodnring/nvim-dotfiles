require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = 'openai'
    },
    inline = {
      adapter = 'openai'
    },
  },
  adapters = {
    openai = function()
      return require("codecompanion.adapters").extend("openai_compatible", {
        env = {
          url = "https://api.avalai.ir", -- optional: default value is ollama url http://127.0.0.1:11434
          api_key = "aa-gbzkMh6Voq5LCjAKVqmDgESrhMnaSAs5CDHEVR449RZOkFfN",               -- optional: if your endpoint is authenticated
          chat_url = "/v1/",        -- optional: default value, override if different
        },
      })
    end,
  },
})
