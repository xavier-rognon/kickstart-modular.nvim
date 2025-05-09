return {
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    unpack = true,
    keys = {
      {
        mode = 'n',
        '<leader>fb',
        function()
          require('conform').format { undojoin = true, async = true, lsp_fallback = true }
        end,
        desc = '[F]ormat buffer',
      },
    },
    notify_on_error = false,
    opts = {
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true, py = true, hs = true, zig = true, lua = true, sh = true }
        return {
          timeout_ms = 1000,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        javascript = { "biome" },
        typescript = { "biome" },
      },
    },
  },
}
