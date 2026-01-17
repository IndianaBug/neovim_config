# Neovim Config

This repository contains my custom Neovim configuration, designed to be simple, fast, and practical for daily development.

---

## 🚀 Overview

* **Plugin Manager:** Uses [lazy.nvim](https://github.com/folke/lazy.nvim) for fast, modular loading.
* **Appearance:** Transparent background with a minimal, terminal-friendly UI.
* **Languages:** Built-in analyzers for Python, Rust, and Lua.
* **AI Integration:** Codeium (Windsurf) and optional OpenAI API support.

---

## 🛠 Language Support

* **Python:** LSP support, formatting, diagnostics, and linting.
* **Rust:** Full `rust-analyzer` integration.
* **Lua:** Optimized for Neovim configuration and plugin development.

---

## 🤖 AI Autocompletion

### Codeium / Windsurf
This config includes Codeium for AI-powered code completion. To authenticate:

1. Open Neovim and run `:Codeium Auth`.
2. Follow the browser login flow and copy the token.
3. Paste the token back into Neovim when prompted.

### OpenAI API (Optional)
To use features requiring OpenAI, export your API key before launching Neovim:

```bash
export OPENAI_API_KEY="your_api_key_here"
```


## 📋 Requirements
* Neovim 0.10+
* Git
* Node.js (required for LSP tooling)
* Python 3
* Rust toolchain (for Rust Analyzer)

## 📥 Installation
Clone the repository into your local Neovim configuration directory:

```bash
git clone [https://github.com/IndianaBug/neovim_config](https://github.com/IndianaBug/neovim_config) ~/.config/nvim
```

## 🪟 Windows (WSL / Ubuntu) – fzf-lua Setup Notes

When using this Neovim config on Windows via WSL (Ubuntu), there are a few important details to ensure fzf-lua works correctly.

❗ Why this is needed

Ubuntu/Debian ship an outdated fzf (0.44.x) which is incompatible with modern fzf-lua.
Symptoms include:

unknown action: transform(...)

fzf-lua pickers crashing or not opening

errors when pressing <Space> f s, <Space> f f, etc.

```
mkdir -p ~/.local/bin
cd ~/.local/bin

FZF_VERSION="$(curl -s https://api.github.com/repos/junegunn/fzf/releases/latest | grep -Po '"tag_name": "v\K[0-9.]+' )"
curl -L -o fzf.tar.gz "https://github.com/junegunn/fzf/releases/latest/download/fzf-${FZF_VERSION}-linux_amd64.tar.gz"

tar -xzf fzf.tar.gz
chmod +x fzf
rm fzf.tar.gz
~/.local/bin/fzf --version
```


## 📄 License

This project is licensed under the **Apache License, Version 2.0**.

You may use, modify, and distribute this configuration in accordance with
the terms of the Apache 2.0 license.

This repository makes use of third-party open-source software (including
Lazy.nvim, LazyVim, and various Neovim plugins), each of which is licensed
under its respective license. See individual project repositories for details.
