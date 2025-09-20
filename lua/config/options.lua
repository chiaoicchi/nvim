-- Visiblility settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Edit settings
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.swapfile = false

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Complete UI
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Set indentation options based on filetype
local indent_settings = {
  rust       = { tabstop = 4, shiftwidth = 4, expandtab = true },
  python     = { tabstop = 4, shiftwidth = 4, expandtab = true },
  javascript = { tabstop = 2, shiftwidth = 2, expandtab = true },
  jsx        = { tabstop = 2, shiftwidth = 2, expandtab = true },
  typescript = { tabstop = 2, shiftwidth = 2, expandtab = true },
  tsx        = { tabstop = 2, shiftwidth = 2, expandtab = true },
  lua        = { tabstop = 2, shiftwidth = 2, expandtab = true },
  go         = { tabstop = 8, shiftwidth = 8, expandtab = false },
  haskell    = { tabstop = 2, shiftwidth = 2, expandtab = true },
  sh         = { tabstop = 2, shiftwidth = 2, expandtab = true },
  sql        = { tabstop = 2, shiftwidth = 2, expandtab = true },
  dockerfile = { tabstop = 2, shiftwidth = 2, expandtab = true },
  terraform  = { tabstop = 2, shiftwidth = 2, expandtab = true },
  hcl        = { tabstop = 2, shiftwidth = 2, expandtab = true },
  json       = { tabstop = 2, shiftwidth = 2, expandtab = true },
  yaml       = { tabstop = 2, shiftwidth = 2, expandtab = true },
  markdown   = { tabstop = 2, shiftwidth = 2, expandtab = true },
}
for ft, opts in pairs(indent_settings) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = function()
      vim.opt_local.tabstop = opts.tabstop
      vim.opt_local.shiftwidth = opts.shiftwidth
      vim.opt_local.expandtab = opts.expandtab
    end,
  })
end

