return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      -- ✅ Models with cost per 1M tokens
      local models = {
        four_o_mini = { name = "gpt-4o-mini", input_cost = 0.15, output_cost = 0.60 },
        o3_mini = { name = "gpt-4o3-mini", input_cost = 1.10, output_cost = 4.40 },
      }

      -- ✅ Default: GPT-4o Mini (cheapest)
      vim.g.current_model = models.four_o_mini

      -- ✅ Function to calculate & display cost
      local function calculate_cost(prompt_tokens, completion_tokens)
        local model = vim.g.current_model
        local input_cost = (prompt_tokens / 1000000) * model.input_cost
        local output_cost = (completion_tokens / 1000000) * model.output_cost
        local total_cost = input_cost + output_cost
        print(string.format("💰 Cost: $%.6f (Tokens: %d in, %d out)", total_cost, prompt_tokens, completion_tokens))
      end

      -- ✅ Function to switch models
      local function set_model(m)
        vim.g.current_model = models[m]
        require("chatgpt").setup({
          api_key_cmd = "echo $OPENAI_API_KEY",
          openai_params = {
            model = vim.g.current_model.name,
          },
          popup_input = {
            prompt = "🔍 Enter your request: ",
            submit = "<C-Enter>",
          },
          popup_window = {
            border = "rounded",
            width = 80,
            height = 20,
          },
        })
        print("🔄 Switched to Model: " .. vim.g.current_model.name)
      end

      -- ✅ Setup ChatGPT.nvim with cost tracking
      require("chatgpt").setup({
        api_key_cmd = "echo $OPENAI_API_KEY",
        openai_params = {
          model = vim.g.current_model.name,
        },
        popup_input = {
          prompt = "🔍 Enter your request: ",
          submit = "<C-Enter>",
        },
        popup_window = {
          border = "rounded",
          width = 80,
          height = 20,
        },
        edit_with_instructions = {
          diff = false,
          keymaps = {
            accept = "<C-y>",
            dismiss = "<C-c>",
          },
        },
        on_response = function(response)
          if response.usage then
            calculate_cost(response.usage.prompt_tokens, response.usage.completion_tokens)
          else
            print("⚠️ No token usage data received.")
          end
        end,
      })

      -- ✅ Keybindings for AI-assisted coding & model switching
      local function set_keymaps()
        vim.keymap.set("i", "<C-Enter>", "<Cmd>ChatGPTCompleteCode<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>cg", ":ChatGPT<CR>", { noremap = true, silent = true })
        vim.keymap.set("v", "<leader>ce", ":ChatGPTEditWithInstruction<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>cy", ":ChatGPTYankLast<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>gm", function()
          set_model("four_o_mini")
        end, { noremap = true, silent = true }) -- Switch to GPT-4o Mini
        vim.keymap.set("n", "<leader>go", function()
          set_model("o3_mini")
        end, { noremap = true, silent = true }) -- Switch to GPT-4o3 Mini
      end

      set_keymaps()
      print("🔥 GPT-4o Mini is the default model. Use `<leader>go>` for GPT-4o3 Mini.")
    end,
  },
}
