-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- set NeoTree background transparent, set other background transparent
vim.cmd([[
  set termguicolors
  colorscheme dracula
  hi NeoTreeNormal guibg=NONE ctermbg=NONE
  hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
  hi BufferLineFill guibg=NONE ctermbg=NONE
  hi BufferLineBackground guibg=NONE ctermbg=NONE
  hi BufferLineBufferSelected guibg=NONE ctermbg=NONE
  hi BufferLineTabSelected guibg=NONE ctermbg=NONE
  hi BufferLineSeparator guibg=NONE ctermbg=NONE
  hi BufferLineSeparatorSelected guibg=NONE ctermbg=NONE
  hi BufferLineSeparatorVisible guibg=NONE ctermbg=NONE
  hi BufferLineTabSeparator guibg=NONE ctermbg=NONE
  hi BufferLineTabSeparatorSelected guibg=NONE ctermbg=NONE
  hi BufferLineOffsetSeparator guibg=NONE ctermbg=NONE
  hi StatusLine guibg=NONE ctermbg=NONE 
  hi Normal guibg=NONE ctermbg=NONE
  hi NonText guibg=NONE ctermbg=NONE
  hi Normal guibg=NONE ctermbg=NONE
  hi NonText guibg=NONE ctermbg=NONE
  hi LspInlayHint guibg=NONE ctermbg=NONE 
  ]])

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.dot" },
  callback = function()
    vim.lsp.start({
      name = "dot",
      cmd = { "dot-language-server", "--stdio" },
    })
  end,
})

-- Fix R code block transparency in Quarto files
local function clear_r_backgrounds()
  vim.cmd("hi! RCodeBlock guibg=NONE ctermbg=NONE")
  vim.cmd("hi! RQuartoNamespace guibg=NONE ctermbg=NONE")
  vim.cmd("hi! RCodeComment guibg=NONE ctermbg=NONE")
  vim.cmd("hi! RCodeIgnore guibg=NONE ctermbg=NONE")
  vim.cmd("hi! @markup.raw guibg=NONE ctermbg=NONE")
  vim.cmd("hi! @markup.raw.block.markdown guibg=NONE ctermbg=NONE")
end

vim.api.nvim_create_autocmd("ColorScheme", { callback = clear_r_backgrounds })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "quarto", "markdown" },
  callback = clear_r_backgrounds
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.qmd", "*.md" },
  callback = clear_r_backgrounds
})

-- Apply immediately for current session
vim.cmd("hi! RCodeBlock guibg=NONE ctermbg=NONE")
vim.cmd("hi! RQuartoNamespace guibg=NONE ctermbg=NONE")
vim.cmd("hi! RCodeComment guibg=NONE ctermbg=NONE")
vim.cmd("hi! RCodeIgnore guibg=NONE ctermbg=NONE")
vim.cmd("hi! @markup.raw guibg=NONE ctermbg=NONE")
vim.cmd("hi! @markup.raw.block.markdown guibg=NONE ctermbg=NONE")

-- ========================
-- TinyMist Pin/Unpin Setup
-- ========================

-- Helper functions
local function get_tinymist_client(bufnr)
  for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = bufnr })) do
    if client.name == "tinymist" then
      return client
    end
  end
  return nil
end

local function pin_main(bufnr)
  local client = get_tinymist_client(bufnr)
  if not client then
    vim.notify("tinymist not attached to this buffer", vim.log.levels.WARN)
    return
  end
  vim.lsp.buf_request(bufnr, "workspace/executeCommand", {
    command = "tinymist.pinMain",
    arguments = { vim.api.nvim_buf_get_name(bufnr) },
  }, function(err)
    if err then
      vim.notify("Error pinning main file: " .. err.message, vim.log.levels.ERROR)
    end
  end)
end

local function unpin_main(bufnr)
  local client = get_tinymist_client(bufnr)
  if not client then
    vim.notify("tinymist not attached to this buffer", vim.log.levels.WARN)
    return
  end
  vim.lsp.buf_request(bufnr, "workspace/executeCommand", {
    command = "tinymist.pinMain",
    arguments = { vim.NIL },
  }, function(err)
    if err then
      vim.notify("Error unpinning main file: " .. err.message, vim.log.levels.ERROR)
    end
  end)
end

-- ========================
-- Global commands
-- ========================
vim.api.nvim_create_user_command("PinMain", function()
  pin_main(0)
end, { desc = "Pin current buffer as main file" })

vim.api.nvim_create_user_command("UnpinMain", function()
  unpin_main(0)
end, { desc = "Unpin main file" })

-- ========================
-- Optional keymaps
-- ========================
vim.keymap.set("n", "<leader>mp", function()
  pin_main(0)
end, { desc = "Pin main file" })
vim.keymap.set("n", "<leader>mu", function()
  unpin_main(0)
end, { desc = "Unpin main file" })

-- ========================
-- Auto-pin on buffer read (tinymist attached)
-- ========================
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    local bufnr = args.buf
    if get_tinymist_client(bufnr) then
      pin_main(bufnr)
    end
  end,
})
