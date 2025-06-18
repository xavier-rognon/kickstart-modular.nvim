return {
  "ThePrimeagen/harpoon",
  enabled = true,
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require('telescope').load_extension('harpoon')
    local harpoon = require("harpoon")

    harpoon:setup()

    vim.keymap.set("n", "<leader>A", function() harpoon:list():prepend() end, { desc = "Add file to the end of harpoon list" })
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add file to the start of harpoon list" })
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open the harpoon menu" })

    vim.keymap.set("n", "<C-y>", function() harpoon:list():select(1) end, { desc = "Go to first list element" })
    vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end, { desc = "Go to second list element" })
    vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end, { desc = "Go to third list element" })
    vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end, { desc = "Go to fourth list element" })
    vim.keymap.set("n", "<leader><C-y>", function()
      harpoon:list():replace_at(1)
      print("Replaced first element")
    end, { desc = "Replace first element" })
    vim.keymap.set("n", "<leader><C-t>", function()
      harpoon:list():replace_at(2)
      print("Replaced second element")
    end, { desc = "Replace second element" })
    vim.keymap.set("n", "<leader><C-n>", function()
      harpoon:list():replace_at(3)
      print("Replaced third element")
    end, { desc = "Replace third element" })
    vim.keymap.set("n", "<leader><C-s>", function()
      harpoon:list():replace_at(4)
      print("Replaced fourth element")
    end, { desc = "Replace fourth element" })
    vim.keymap.set("n", "<header><C-c>", function() harpoon:list():clear() end, { desc = "Clear the list" })
  end,
  opts = {
    settings = {
      enter_on_sendcmd = false,
      excluded_filetypes = { "harpoon", "alpha", "dashboard", "gitcommit" },
      mark_branch = false,
      save_on_change = true,
      save_on_toggle = true,
      sync_on_ui_close = false,
      tmux_autoclose_windows = false,
    },
  },
}
