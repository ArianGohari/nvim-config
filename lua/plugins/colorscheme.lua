return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      require("dracula").setup(opts)
      vim.cmd("colorscheme dracula")

      local hl = function(name, val) vim.api.nvim_set_hl(0, name, val) end
      local none = { bg = "NONE" }

      -- General transparency
      hl("Normal",       { bg = "NONE" })
      hl("NormalFloat",  { bg = "NONE" })
      hl("FloatBorder",  { bg = "NONE" })
      hl("NonText",      { bg = "NONE" })
      hl("CursorLine",   { bg = "NONE" })
      hl("SignColumn",   { bg = "NONE" })
      hl("LspInlayHint", { bg = "NONE" })

      -- Statusline
      hl("StatusLine",   { bg = "NONE" })
      hl("StatusLineNC", { bg = "NONE" })

      -- mini.statusline mode colors (fg only, no bg)
      hl("MiniStatuslineModeNormal",  { bg = "NONE", fg = "#bd93f9" })
      hl("MiniStatuslineModeInsert",  { bg = "NONE", fg = "#50fa7b" })
      hl("MiniStatuslineModeVisual",  { bg = "NONE", fg = "#ffb86c" })
      hl("MiniStatuslineModeReplace", { bg = "NONE", fg = "#ff5555" })
      hl("MiniStatuslineModeCommand", { bg = "NONE", fg = "#f1fa8c" })
      hl("MiniStatuslineModeOther",   { bg = "NONE", fg = "#f8f8f2" })
      hl("MiniStatuslineFilename",    { bg = "NONE", fg = "#f8f8f2" })
      hl("MiniStatuslineFileinfo",    { bg = "NONE", fg = "#6272a4" })
      hl("MiniStatuslineDevinfo",     { bg = "NONE", fg = "#6272a4" })
      hl("MiniStatuslineInactive",    { bg = "NONE", fg = "#6272a4" })

      -- Completion menu
      hl("Pmenu",      none)
      hl("PmenuSel",   none)
      hl("PmenuSbar",  none)
      hl("PmenuThumb", none)

      -- Telescope
      hl("TelescopeNormal",        none)
      hl("TelescopeBorder",        none)
      hl("TelescopePromptNormal",  none)
      hl("TelescopePromptBorder",  none)
      hl("TelescopeResultsNormal", none)
      hl("TelescopeResultsBorder", none)
      hl("TelescopePreviewNormal", none)
      hl("TelescopePreviewBorder", none)
      hl("TelescopeSelection",     none)
      vim.api.nvim_set_hl(0, "TelescopePromptCounter", { link = "Normal" })

      -- Markdown headings bold
      local heading_colors = { "#bd93f9", "#50fa7b", "#8be9fd", "#ffb86c", "#ff79c6", "#f1fa8c" }
      for i, fg in ipairs(heading_colors) do
        hl("@markup.heading." .. i .. ".markdown", { bg = "NONE", fg = fg, bold = true })
      end

      -- Markdown links
      hl("@markup.link",                    { bg = "NONE", fg = "#6272a4" })
      hl("@markup.link.label",              { bg = "NONE", fg = "#6272a4" })
      hl("@markup.link.label.markdown",     { bg = "NONE", fg = "#6272a4" })
      hl("@markup.link.url",                { bg = "NONE", fg = "#6272a4" })

      -- Split separator
      hl("WinSeparator", { bg = "NONE", fg = "#6272a4" })
    end,
  },
}
