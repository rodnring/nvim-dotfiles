local options = {
  providers = {
    ["avalai-claude"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "anthropic.claude-3-5-sonnet-20240620-v1:0",
      api_key_name = "OPENAI_API_KEY",
      extra_request_body = {
        max_tokens = 8192,
        timeout = 30000,
      },
    },
    ["avalai-gemini"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "gemini-2.5-pro-preview-05-06",
      disable_tools = true,
      api_key_name = "OPENAI_API_KEY",
      extra_request_body = {
        temperature = 0.2,
        max_tokens = 8192,
        timeout = 30000,
      },
    },
    ["avalai-deepseek"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "deepseek-coder",
      api_key_name = "OPENAI_API_KEY",
      extra_request_body = {
        temperature = 0.2,
        timeout = 30000,
        max_tokens = 4096,
      },
    },
    ["avalai-gpt-4.5-preview"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "gpt-4.5-preview-2025-02-27",
      api_key_name = "OPENAI_API_KEY",
      extra_request_body = {
      temperature = 0.2,
        timeout = 30000,
        max_tokens = 4096,
      },
    },
    ["avalai-chatgpt-4o-latest"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "chatgpt-4o-latest",
      api_key_name = "OPENAI_API_KEY",
      extra_request_body = {
        max_tokens = 4096,
        temperature = 0.2,
        timeout = 30000,
      },
    },
    ["avalai-gpt-4.1-mini"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "gpt-4.1-mini",
      api_key_name = "OPENAI_API_KEY",
      extra_request_body = {
        temperature = 0.2,
        timeout = 30000,
        max_tokens = 32000,
        max_completion_tokens = 32000,
      },
    },
    ["avalai-codestral"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "codestral-2501",
      api_key_name = "OPENAI_API_KEY",
      extra_request_body = {
        temperature = 0.2,
        timeout = 30000,
        max_tokens = 128000,
      },
    },
    ["avalai-o4-mini"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "o4-mini",
      api_key_name = "OPENAI_API_KEY",
      extra_request_body = {
        temperature = 0.2,
        timeout = 30000,
        max_tokens = 64000,
        max_completion_tokens = 128000,
      },
    },
    ["avalai-o1-mini"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "o1-mini",
      api_key_name = "OPENAI_API_KEY",
      extra_request_body = {
        temperature = 0.2,
        timeout = 30000,
        max_tokens = 8192,
      },
    },
    ["avalai-gpt-4.1"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "gpt-4.1",
      api_key_name = "OPENAI_API_KEY",
      extra_request_body = { temperature = 0.2, timeout = 30000, max_tokens = 16384 },
    },
    ["avalai-gpt-4.1-nano"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "gpt-4.1-nano",
      api_key_name = "OPENAI_API_KEY",
      extra_request_body = {
        temperature = 0.2,
        timeout = 30000,
        max_completion_tokens = 32000,
        max_tokens = 32000,
      },
    },
    ["avalai-grok-3-mini"] = {
      __inherited_from = "openai",
      endpoint = "https://api.avalai.ir/v1",
      model = "grok-3-mini",
      api_key_name = "OPENAI_API_KEY",
      extra_request_body = {
        max_completion_tokens = 32768,
        temperature = 0.2,
        timeout = 30000,
        max_tokens = 4096,
      },
    },
    openai = {
      endpoint = "https://api.avalai.ir/v1",
      extra_request_body = {
        timeout = 30000,
        temperature = 0.2,
        model = "gpt-4o-mini",
        max_tokens = 16000,
        max_completion_tokens = 16000,
      },
    },
    auto_suggestions_provider = "avalai-gpt-4.1-nano",
    cursor_applying_provider = "avalai-gpt-4.1-nano",
    behaviour = {
      enable_cursor_planning_mode = true, -- enable cursor planning mode!
      auto_suggestions = false,
    },
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
