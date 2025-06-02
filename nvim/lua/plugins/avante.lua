return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  lazy = false,
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    provider = 'openai',
    openai = {
      endpoint = '',

      model = 'unsloth/Devstral-Small-2505-GGUF',
      timeout = 300000, -- timeout in milliseconds, inherited by vendors
      temperature = 0.15, -- default temperature, inherited by vendors
      max_tokens = 131072, -- default max_tokens, inherited by vendors
    },

    -- vendors = {
    --   openai_qwen_32b = {
    --     __inherited_from = 'openai',
    --     model = 'qwen3-32b-128k',
    --     -- temperature = 0.7,
    --   },
    --   openai_devstral_small_q4_K_XL_UD = {
    --     __inherited_from = 'openai',
    --     model = 'unsloth/Devstral-Small-2505-GGUF',
    --     temperature = 0.15,
    --     min_p = 0.01,
    --   },
    -- },
    rag_service = {
      enabled = true, -- Enable the RAG service
      -- host_mount determines which local files the RAG service (running in Docker) can access.
      -- os.getenv("HOME") mounts your home directory (read-only).
      -- Adjust if your projects are elsewhere or if you want to limit/expand access.
      -- For example, to mount the whole filesystem (use with caution): host_mount = "/",
      host_mount = os.getenv 'HOME' .. '/.config',
      provider = 'openai', -- This is correct for LM Studio's OpenAI-compatible API
      llm_model = 'unsloth/Devstral-Small-2505-GGUF', -- Replace with the specific model name from your LM Studio
      embed_model = 'nomic-ai/nomic-embed-text-v2-moe-GGUF', -- *** ACTION REQUIRED: Verify and update this model name ***
      endpoint = '',
    },
    web_search_engine = {
      provider = 'google', -- tavily, serpapi, searchapi, google, kagi, brave, or searxng
      proxy = nil, -- proxy support, e.g., http://127.0.0.1:7890
    },
  },
  build = 'make',
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'echasnovski/mini.pick', -- for file_selector provider mini.pick
    'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
    'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
    'ibhagwan/fzf-lua', -- for file_selector provider fzf
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'zbirenbaum/copilot.lua', -- for providers='copilot'
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
