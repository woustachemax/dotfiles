# dotfiles
My personal Neovim config built on top of some GOATs.

## Setup

Built on [LazyVim](https://github.com/LazyVim/LazyVim) as the base distro with a few tweaks.

```bash
git clone https://github.com/woustachemax/dotfiles.git ~/.config/nvim
nvim
```

LazyVim will bootstrap everything

## Content

- **Base**: LazyVim starter
- **Theme**: Solarized Osaka (transparent)
- **Dashboard**: Custom ASCII header
- **Bufferline**: Tab-style buffer navigation
- **Neo-tree**: File explorer
- **Telescope**: Fuzzy finder
- **LSP**: Mason + pyright + ts_ls
- **Autocomplete**: nvim-cmp with LuaSnip

## Credits

This config wouldn't exist without these people:

- [craftzdog](https://github.com/craftzdog/dotfiles-public) - Solarized Osaka theme, UI config inspiration, bufferline setup
- [folke](https://github.com/folke) - LazyVim, lazy.nvim, noice.nvim, snacks.nvim and basically half the nvim plugin ecosystem
- [LazyVim](https://github.com/LazyVim/LazyVim) - the starter template this is built on

## Neovim version

Requires Neovim >= 0.11