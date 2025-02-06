local options = {
  provider = "ollama",
  vendors = {
    ollama = {
      __inherited_from = "openai",
      endpoint = 'http://127.0.0.1:11434/v1',
      model = 'qwen2.5-coder:7b',
      max_tokens = 4096,
    },
    customik = {
      __inherited_from = "openai",
      endpoint = 'https://api.avalai.ir/v1',
      model = 'gpt-4o-mini'
    }
  },
  openai = {
    endpoint = 'https://api.avalapis.ir/v1',
    model = 'gpt-4o-mini',
  },
  auto_suggestions_provider = "openai",
  behaviour = {
    auto_suggestions = false,
  },
}

return options
