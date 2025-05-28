local options = {
  provider = "openai",
  vendors = {
    ["avalai-claude"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "anthropic.claude-3-5-sonnet-20240620-v1:0",
      max_tokens = 8192,
      api_key_name = "OPENAI_API_KEY",
      disable_tools = true,
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
    ["avalai-gpt-4.5-preview"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "gpt-4.5-preview-2025-02-27",
      temperature = 0.2,
      max_tokens = 4096,
      api_key_name = "OPENAI_API_KEY",
    },
    ["avalai-chatgpt-4o-latest"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "chatgpt-4o-latest",
      temperature = 0.2,
      max_tokens = 4096,
      api_key_name = "OPENAI_API_KEY",
    },
    ["avalai-gpt-4.1-mini"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "gpt-4.1-mini",
      temperature = 0.2,
      max_tokens = 4096,
      api_key_name = "OPENAI_API_KEY",
    },
    ["avalai-codestral"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "codestral-2501",
      temperature = 0.2,
      max_tokens = 8192,
      api_key_name = "OPENAI_API_KEY",
    },
  },
  openai = {
    endpoint = "https://api.avalai.ir/v1",
    timeout = 30000,
    temperature = 0.2,
    model = "gpt-4o-mini",
    max_tokens = 8192,
  },
  auto_suggestions_provider = "openai",
  behaviour = {
    auto_suggestions = false,
  },
  tools = {
    {
      name = "example_tool",
      description = "An example tool for demonstration.",
      param = {
        fields = {
          { name = "input_field", type = "string", description = "Input field description", optional = false },
        },
      },
    },
  },
}

return options
