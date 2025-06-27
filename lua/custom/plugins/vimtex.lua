return {
  "lervag/vimtex",
  ft = { "tex", "bib" },
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    vim.g.tex_flavor = 'latex'
    vim.g.vimtex_quickfix_mode = 0

    -- Set conceallevel for better readability
    vim.opt.conceallevel = 1
    vim.g.tex_conceal = 'abdmg'

    -- Enable folding
    vim.g.vimtex_fold_enabled = 1
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'vimtex#fold#level(v:lnum)'

    -- Compiler settings
    vim.g.vimtex_compiler_latexmk = {
      build_dir = '',
      callback = 1,
      continuous = 1,
      executable = 'latexmk',
      hooks = {},
      options = {
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
      },
    }

    vim.g.vimtex_compiler_method = 'latexmk'

    -- Most VimTeX mappings rely on localleader
    -- vim.g.maplocalleader = ' '
  end
}
