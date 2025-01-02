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
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])
