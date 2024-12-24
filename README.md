# My Neovim config

This is a custom Neovim configuration highly (sollely) inspired by the various good practices and guides available on internet. This configuration focuses on bringing a pleasant coding and scripting experience in neovim while keeping configuration transparent with (almost) all settings motivated and provided in lua scripting language.

## Highlights

This configuration will allow a seemless coding experience through the following features:
- Code diagnostic
- Automatic code formating for supported languages
- File explorer window with custom highlighting for buffer and git related status.
- Code completion through automatic Language server Protocol configuration
- Git integration with a dedicated Git window and convenient shortcuts and panes for conflict resolution
- Language specific code highlighting
- Customizable theme 

## Prerequisites

- NeoVim tested with `v0.10.2`
- Git `2.39.3`
- Nerdfonts installation [nerdfonts.com](https://www.nerdfonts.com/)
- gcc and libstdc++
- curl
- [ripgrep](https://github.com/BurntSushi/ripgrep) (multithreaded and more understandable verison of _grep_)
- [fd](https://github.com/sharkdp/fd) (simple fast alternative of _find_)
- [fzf](https://github.com/junegunn/fzf) (cli fuzzy finder)

## Neovim settings

The neovim settings are the various configuration values and autocommands that I have juged usefull to include. Those do not relate to plugin directly but might impact plugins behaviour if they rely on global config. These settings can be found in [lua/set.lua](https://github.com/franadr/my_config/blob/main/neovim_config/lua/set.lua).

- Pressing `<Esc>` when searching (i.e. `/`) will clear highlight.
- The yanked selection will blink on yank.
- When iterating through serach item match, keep the match in the middle of the window.
- When using `<leader>p` to paste en lieu of a selection, the initial yanked value is kept. (instead of being replaced by the deleted selection)
- Mouse mode is enabled
- The search is case-insensitive
- New verical split will pop on the right
- New horizontal split will pop bellow
- Subsition will be computed live as you type
- Line number and relative line number are shown
- Tab size is 4 space
- Line are wrapped when overflowing
- The undo history is written to a file in `~/.vim/undodir`
- No highlight of the search item but rather incremental highlight when typing
- When scrolling, 8 lines are kept above the cursor
- The sign column is shown (e.g. showing line warning icon)
- Refresh time is 250ms

## Neovim Shortcuts

The shortcuts are split among plugin specific shortcuts and vim global shortcuts. Their specification can be foudn respectively in [lua/plugins/*](https://github.com/franadr/my_config/tree/main/neovim_config/lua/plugins) and [lua/remap.lua](https://github.com/franadr/my_config/blob/main/neovim_config/lua/remap.lua).

### Neovim global shortcuts

|Mode   |Key    |Target         |
|-------|-------|---------------|
|normal |`<space>`  |Leader key  |
|visual |`J`(`K`)   |Move selection up (Down)|
|normal |`J`        |Append nextline to current line without moving cursor|
|normal |`<C-d(u)>` |Move cursor half page down (up) while keeping it centered|
|n & v  |`<leader>y`|Yank to system register (clipboard)|
|normal |`<leader>s`|Spawn command to replace occurences of current word|
|normal |`<leader>q`|Open diagnostic list|
|normal |`<C-h>`    |Move focus to left split|
|normal |`<C-k>`    |Move focus to upper split|
|normal |`<C-j>`    |Move focus to lower split|
|normal |`<C-l>`    |Move focus to right split|
