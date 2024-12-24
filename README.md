# My Neovim config

This is a custom Neovim configuration highly (sollely) inspired by the various good practices and guides available on internet. This configuration focuses on bringing a pleasant coding and scripting experience in neovim while keeping configuration transparent with (almost) all settings motivated and provided in lua scripting language.

## Highlights

This configuration will allow a seemless coding experience through the following features:
- Code diagnostic
- Automatic code formating for supported languages
- File explorer window with custom highlighting for buffer and git related status.
- Local file changes history 
- Code completion through automatic Language server Protocol configuration
- Git integration with a dedicated Git window and convenient shortcuts and panes for conflict resolution
- Language specific code highlighting
- Customizable theme 

## Prerequisites

- NeoVim tested with 
- Git
- Nerdfonts installation [nerdfonts.com](https://www.nerdfonts.com/)
- gcc and libstdc++
- curl
- unzip
- tar
- gzip
- [ripgrep](https://github.com/BurntSushi/ripgrep) (multithreaded and more understandable verison of _grep_)
- [fd](https://github.com/sharkdp/fd) (simple fast alternative of _find_)
- [fzf](https://github.com/junegunn/fzf) (cli fuzzy finder)
- Language specific sdk/tooling: go, python, npm, cargo, rust

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

## Usage
The aim of this configuration is to allow a seemless coding experience, this section should help you reach that smooth experience.
### Workflows

#### Open projet root folder
Usually the project source code and related files are contained within a folder. To start Neovim within that folder, simply move there and start neovim. This should open neovim with the file explorer pane open at the root of the project.
To open a file, navigate the tree and press `<CR>` (enter).
```bash
> cd ~/projects/gpass
> nvim .
```

#### Saving and reviewing changes
After editing, the file can be saved and the changes can be reviewed directly within git window.\
1. Save with `:w` or save and close with `ZZ` (x2 capital "z")
2. Open _fugitive_ window, default is `<leaded>gs` 
3. Move the cursor over the file you're willing to review
4. Press `=` to show inline diff
5. _Alternatively_ use `dv` to open a vertical split with the left pane being the HEAD version and the right pane the currentversion

#### Staging, commiting and push
Once the changes are satisfactory, the changes can be staged, commited and pushed to the remote repository.
1. Open _fugitive_ with `<leader>gs`
2. Move cursor over the unstaged files
3. Press `s` to stage the file(s) (you can have multiple selection by using visual mode to include multiple files)
4. Press `cc` to commit, this opens a commit message window, when done press `ZZ` to close and commit
5. Once commited press `<leader>p` to push. (The process might take 1s to show results down the terminal window)

### Neovim Shortcuts

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
