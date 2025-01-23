return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require('lspconfig')

    -- PYLSP SETUP! YEAH!
    lspconfig.pylsp.setup({
      -- Tell pylsp to find the python-lsp-server in your virtualenv
      cmd = { "path/to/my_venv/bin/pylsp" },  -- Adjust if needed

      settings = {
        pylsp = {
          plugins = {
            pycodestyle = { 
              enabled = true, 
              ignore = {}, 
              maxLineLength = 88 
            },
            pyflakes = { enabled = true },
            pylint = { enabled = false },     -- Turn it on if you prefer pylint
            mccabe = { enabled = true, threshold = 10 },
            yapf = { enabled = false },
            autopep8 = { enabled = false },
            black = { enabled = true },       -- requires pylsp-black
            isort = { enabled = true },       -- requires isort to be installed
            mypy = { enabled = true },        -- requires pylsp-mypy
          }
        }
      }
    })

    -- If you want Pyright as well, go wild:
    lspconfig.pyright.setup({
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic", 
            -- Or "strict" if you want to get REALLY hyped about type checks
          },
        },
      },
    })

  end
}

