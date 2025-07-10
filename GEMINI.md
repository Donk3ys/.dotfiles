# Dotfiles Repository

This repository contains personal dotfiles for various applications, managed using GNU Stow.

## Core Concept

The primary tool for managing these configurations is [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory in this repository (e.g., `nvim`, `zsh`, `i3`) is a "stow package." The `stow` command is used to create symlinks from the files in these packages to their correct locations in the user's home directory (e.g., from `nvim/.config/nvim` to `~/.config/nvim`).

The `.stow-global-ignore` file lists files and directories that should not be stowed, such as `GEMINI.md`.

## Installation

The repository contains shell scripts for setting up a new machine:

*   `install_linux_arch.sh`: For Arch Linux based systems.
*   `install_linux_ubuntu.sh`: For Ubuntu/Debian based systems.
*   `install_macos.sh`: For macOS systems.

These scripts typically install necessary software packages and then use `stow` to link the configurations.

## Directory Structure

Each directory contains the configuration files for a specific application, structured to mirror the target path in the home directory.

*   `alacritty/`: Configuration for the Alacritty terminal emulator.
*   `i3/`: Configuration for the i3 window manager, including keybindings and various status bar scripts.
*   `nvim/`: A detailed Neovim configuration. It has its own `GEMINI.md` file for more specific information about its Lua-based setup, plugins (managed with `lazy.nvim`), and LSP configurations.
*   `tmux/`: Configuration for the tmux terminal multiplexer, including TPM (Tmux Plugin Manager).
*   `zsh/`: Configuration for the Zsh shell, including `.zshrc`, `.zshenv`, custom functions, and themes.

## General Workflow

*   **To apply configurations:** Run `stow <directory-name>` (e.g., `stow nvim`) from the root of this repository. To stow all configurations, you can run `stow *`.
*   **To add a new configuration:**
    1.  Create a new directory for the application (e.g., `rofi`).
    2.  Inside that directory, replicate the structure of where the configuration files should live in your home directory (e.g., `rofi/.config/rofi/config.rasi`).
    3.  Run `stow rofi` to create the symlinks.
*   **To update configurations:** Simply edit the files within this repository. The changes are automatically reflected in your system because they are symlinked.
