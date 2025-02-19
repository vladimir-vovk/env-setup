return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  config = function()
    require("fzf-lua").setup({
      colorscheme = "solarized",
      winopts = {
        fullscreen = true,
        preview = {
          layout = "vertical",
          vertical = "up:45%", -- up|down:size
        },
      },
      fzf_opts = {
        ["--keep-right"] = "", -- https://github.com/ibhagwan/fzf-lua/issues/269
        ["--layout"] = "default",
        -- ["--ansi"] = false,
      },
      keymap = {
        fzf = {
          ["ctrl-r"] = "select-all+accept", -- https://github.com/ibhagwan/fzf-lua/issues/324
        },
      },
      files = {
        git_icons = false,
        file_icons = false,
      },
    })

    vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })

    vim.keymap.set("n", "<leader>bb", "<cmd>lua require('fzf-lua').buffers()<CR>", { desc = "Fuzzy find recent files" })

    vim.keymap.set(
      "n",
      "<leader>/",
      "<cmd>lua require('fzf-lua').live_grep_resume()<CR>",
      { desc = "Find string in cwd" }
    )

    vim.keymap.set("n", "gr", ":FzfLua lsp_references<CR>")
  end,
}
