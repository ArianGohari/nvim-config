# nvim config

Plain lazy.nvim + mini.nvim setup. Migrated from LazyVim in May 2026 because the distro got in the way more than it helped.

No file tree, no tab bar, no dashboard. LSPs are system-installed (brew/npm/pip), same as Helix. Mason is only used for DAP adapters.

## Plugins

| Plugin | Purpose |
|--------|---------|
| [mini.nvim](https://github.com/echasnovski/mini.nvim) | statusline, completion, pairs, surround, comment, ai, bufremove, indentscope |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP (via `vim.lsp.enable`) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | syntax highlighting |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | fuzzy finder |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | formatting |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | debugging |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | git decorations |
| [Dracula](https://github.com/Mofiqul/dracula.nvim) | colorscheme (transparent) |
| [nvim-java](https://github.com/nvim-java/nvim-java) | Java |
| [flutter-tools.nvim](https://github.com/nvim-flutter/flutter-tools.nvim) | Flutter/Dart |
| [quarto-nvim](https://github.com/quarto-dev/quarto-nvim) | Quarto |
| [xcodebuild.nvim](https://github.com/wojciech-kulik/xcodebuild.nvim) | Swift/Xcode |

## Languages

Go, C, C++, Zig, Python, TypeScript, JavaScript, Svelte, Swift, Java, Kotlin, Dart, R, Quarto

## Requirements

- Neovim 0.11+
- A Nerd Font
- Language servers installed via brew/npm/pip
