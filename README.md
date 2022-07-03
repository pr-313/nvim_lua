# My IDE config for Neovim

> Why does this repo exist?

Cause I cloned it from LunarVim '-' (thanks Chris)
No, but seriously this is the config I am using for my work. My work is not a lot of coding but I do end up living in the terminal all the time. Dealing with log files and verilog files sized upto 30GB uncompressed. Hence I am trying to keep it as high performance as possible. And also installable without admin privileges. 

## Install Neovim 0.7

Use a non auto updating installation of nvim ideally. I would recommend trying the release 0.7 nvim.appimage file first before trying to build from source.
Check here for building instructions [Build from Source](https://github.com/neovim/neovim/wiki/Building-Neovim)

## Install the config

Make sure to remove or move your current `nvim` directory

```sh
git clone https://github.com/pr-313/nvim_lua.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed 

**NOTE** Checkout this file for some predefined keymaps: [keymaps](https://github.com/pr-313/nvim_lua/blob/master/lua/user/keymaps.lua)

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

Copy/paste will vary drastically from system to system. Looking up any tutorial that fixes the clipboard issue for vim for your system.

Next we need to install python support (node is optional)

- Neovim python support

  ```sh
  python3 -m pip install --user pynvim
  ```

- Neovim node support
I did not have node installed on my system hence I used the script here along with the --prefix arg to install in a custom location [install node](https://github.com/vercel/install-node)

After the install add the subsequently formed bin folder to your $PATH and then execute npm install.

  ```sh
  npm i -g neovim
  ```


- Ripgrep
We will also need `ripgrep` and `fd` for Fzf-Lua to work faster: 
I used the precompiled binary, and added it to a bin folder I have in my $PATH. Else you can always install rust and run cargo install

  ```sh
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh  
  ```
Follow the prompt to source the env file that makes the cargo executable available in your terminal then follow the instruction on the below links.
[Ripgrep Install](https://github.com/BurntSushi/ripgrep#installation)
[fd Install](https://github.com/sharkdp/fd#installation)

## Fonts

I recommend using the following repo to get a "Nerd Font" (Font that supports icons)

[getnf](https://github.com/ronniedroid/getnf)

## Configuration

### LSP

To add a new LSP

First Enter:

```
:LspInstallInfo
```

and press `i` on the Language Server you wish to install

Next you will need to add the server to this list in the lua/user/lsp-installer.lua file

### Formatters and linters

Make sure the formatter or linter is installed and add it to the setup function in the lua/user/null-ls.lua file.

**NOTE** Some are already setup as examples, remove them if you want

### Plugins

You can install new plugins in the lua/user/plugins.lua file

---


> The computing scientist's main challenge is not to get confused by the complexities of his own making. 

\- Edsger W. Dijkstra
