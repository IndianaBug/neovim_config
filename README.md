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

```
