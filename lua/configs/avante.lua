local options = {
  provider = "openai",
  vendors = {
    ["avalai-claude"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "anthropic.claude-3-5-sonnet-20240620-v1:0",
      max_tokens = 8192,
      api_key_name = "OPENAI_API_KEY",
    },
    ["avalai-gemini"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "gemini-2.5-pro-preview-05-06",
      temperature = 0.2,
      max_tokens = 8192,
      api_key_name = "OPENAI_API_KEY",
    },
    ["avalai-deepseek"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "deepseek-coder",
      temperature = 0.2,
      max_tokens = 4096,
      api_key_name = "OPENAI_API_KEY",
    },
  },
  openai = {
    endpoint = "https://api.avalai.ir/v1",
    model = "gpt-4o-mini-2024-07-18",
  },
  dual_boost = {
    enabled = false,
    first_provider = "openai",
    second_provider = "avalai-gemini",
    prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
    timeout = 60000, -- Timeout in milliseconds
  }, -- add any opts here
  suggestion = {
    enabled = true,
    max_tokens = 8192,
    provider = "openai",
    debounce = 3000,
    throttle = 1100,
  },
}

return options
