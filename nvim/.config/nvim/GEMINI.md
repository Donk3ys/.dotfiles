# Neovim Configuration

This document outlines the structure and functionality of this Neovim configuration.

## Core Components

The core of the configuration resides in the `init.lua` file and the `lua/donk3y/` directory.

### `init.lua`

This is the main entry point for the Neovim configuration. It simply loads the custom configuration from `lua/donk3y/init.lua`.

### `lua/donk3y/`

This directory contains the custom Lua modules that form the foundation of the configuration.

*   **`init.lua`**: This file loads the other modules in this directory (`set.lua`, `map.lua`, and `lazy.lua`) and sets the color scheme to `gruvbox-material`.
*   **`set.lua`**: This file configures general Neovim settings, such as line numbers, indentation, and search behavior. It also sets up an autocommand to adjust the `shiftwidth` for C# files.
*   **`map.lua`**: This file defines custom key mappings for various actions, including buffer navigation, tabbing, and copy-pasting.
*   **`lazy.lua`**: This file manages the plugins used in this configuration. It uses the `lazy.nvim` plugin manager to declare and configure all the other plugins.

## Plugin Configuration (`after/plugin/`)

The `after/plugin/` directory contains the configuration files for the various plugins used in this setup. These are loaded by `lazy.nvim` according to the plugin specifications in `lua/donk3y/lazy.lua`.

*   **`autopairs.lua`**: Configures the `nvim-autopairs` plugin to automatically insert matching pairs of brackets, parentheses, and quotes.
*   **`cmp.lua`**: Configures the `nvim-cmp` plugin for auto-completion, including sources for LSP, snippets, buffers, and paths.
*   **`dap.lua`**: Configures the `nvim-dap` plugin for debugging, with specific configurations for C#, Dart/Flutter, Go, and TypeScript/JavaScript. It also integrates with `dapui` for a graphical debugging interface.
*   **`general.lua`**: This file contains the configuration for a variety of plugins, including:
    *   `todo-comments.nvim`: Highlights TODO comments.
    *   `toggleterm.nvim`: Provides an integrated terminal.
    *   `indent-blankline.nvim`: Adds indentation guides.
    *   `scrollbar.nvim`: Adds a scrollbar.
    *   `fidget.nvim`: Provides LSP progress notifications.
    *   `gitsigns.nvim`: Adds Git integration.
    *   `illuminate`: Highlights the word under the cursor.
    *   `oil.nvim`: A file explorer.
    *   `log-highlight.nvim`: Highlights log files.
    *   `nvim-highlight-colors`: Highlights color codes.
    *   `dart-data-class-generator.nvim`: A data class generator for Dart.
*   **`lspconfig.lua`**: Configures the Language Server Protocol (LSP) for various languages, including Bash, C#, Dart/Flutter, Gleam, Go, Solidity, Svelte, Tailwind CSS, TypeScript, and YAML. It also sets up an `on_attach` function to define key mappings for LSP actions.
*   **`lualine.lua`**: Configures the `lualine.nvim` plugin to create a custom status line with information about the current mode, file, Git branch, and diagnostics.
*   **`telescope.lua`**: Configures the `telescope.nvim` plugin for fuzzy finding files, live grepping, and other navigation tasks.
*   **`treesitter.lua`**: Configures the `nvim-treesitter` plugin for syntax highlighting and indentation. It also integrates with `ufo` for code folding.

## Plugin Management

This configuration uses `lazy.nvim` to manage plugins. The full list of plugins and their configurations can be found in `lua/donk3y/lazy.lua`.