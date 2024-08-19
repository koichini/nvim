# NvChad
[NvChad](https://nvchad.com/)を利用した個人用のrepo

## 必要要件
`Neovim 0.10`, `NerdFont`, `Ripgrep`, `LazyGit`  
(windows: `mingw`, `GnuWin`)  
https://nvchad.com/docs/quickstart/install

## Installation
`~/.config/nvim`ディレクトリをこのrepoに差し替え

## 設定メモ
`./lua/chadrc.lua` 主なユーザー設定を行う  
`./lua/options.lua` インデントの設定  
`./lua/configs/lspconfig.lua` LSPの設定  

## Tips
luaでの設定の書き方: [Lua-guide - Neovim docs](https://neovim.io/doc/user/lua-guide.html#lua-guide)

**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

# Mason
  Language Filter: press <C-f> to apply filter

  Installed
      eslint-lsp
      gofumpt
      gopls
      json-lsp
      lua-language-server
      prettier
      rust-analyzer
      typescript-language-server


