# My Neovim config

## Neovim settings

The neovim settings are the various configuration values and autocommands that I have juged usefull to include. Those do not relate to plugin directly but might impact plugins behaviour if they rely on global config.

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

The shortcuts are split among plugin specific shortcuts and vim global shortcuts. Their speciication can be foudn respectively in `lua/plugins/PLUGIN_NAME.lua` and `lua/remap.lua`.

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
