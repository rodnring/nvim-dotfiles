require('minuet').setup {
  virtualtext = {
    auto_trigger_ft = {},
    keymap = {
      -- accept whole completion
      accept = '<A-w>',
      -- accept one line
      accept_line = '<A-a>',
      -- accept n lines (prompts for number)
      accept_n_lines = '<A-z>',
      -- Cycle to prev completion item, or manually invoke completion
      prev = '<A-[>',
      -- Cycle to next completion item, or manually invoke completion
      next = '<A-]>',
      dismiss = '<A-e>',
    },
  },
  notify = 'debug',
  provider = 'openai_fim_compatible',
  n_completions = 1, -- recommend for local model for resource saving
  -- I recommend beginning with a small context window size and incrementally
  -- expanding it, depending on your local computing power. A context window
  -- of 512, serves as an good starting point to estimate your computing
  -- power. Once you have a reliable estimate of your local computing power,
  -- you should adjust the context window to a larger value.
  context_window = 4096,
  context_ratio = 0.75,
  debounce = 1500,
  throttle = 900,
  provider_options = {
    openai_fim_compatible = {
      api_key = 'OPENAI_API_KEY',
      name = 'avalai-4.1-nano',
      stream = true,
      end_point = 'https://api.avalai.ir/v1/',
      model = 'gpt-4.1-nano',
      optional = {
        max_tokens = 32000,
        top_p = 0.2,
      },
    },
  },
}
