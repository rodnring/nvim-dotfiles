local options = {
        -- provider = "ollama",
        -- vendors = {
        --   ollama = {
        --     __inherited_from = "openai",
        --     endpoint = 'http://127.0.0.1:11434/v1',
        --     model = 'deepseek-r1:14b',
        --   }
        -- },
        provider = "openai",
        openai = {
          endpoint = "https://api.avalai.ir/v1",
          model = "gpt-4o-mini-2024-07-18",
        },
        claude = {
          endpoint = "https://api.avalai.ir/",
          model = "anthropic.claude-3-5-haiku-20241022-v1:0",
          temperature = 0,
          max_tokens = 4096,
        },
        dual_boost = {
          enabled = false,
          first_provider = "openai",
          second_provider = "claude",
          prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
          timeout = 60000, -- Timeout in milliseconds
        }, -- add any opts here
        suggestion = {
          debounce = 3000,
          throttle = 1100,
        },
      }

return options
