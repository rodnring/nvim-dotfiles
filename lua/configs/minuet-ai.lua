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
  context_window = 2048,
  provider_options = {
    openai_fim_compatible = {
      api_key = 'TERM',
      name = 'Qwen2.5-coder',
      stream = true,
      end_point = 'http://localhost:11434/v1/completions',
      model = 'qwen2.5-coder:7b',
      optional = {
        max_tokens = 1024,
        top_p = 0.9,
      },
    },
  },
}
