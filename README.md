## Martin's GNU Emacs

These are my personal Emacs configuration files, which I have been maintaining since April 2018.

This configuration has been tested on Emacs 28. It might work with older versions, but personally I run 28 (the standard Fedora package).

#### Various features are supported, including:

- `evil-mode` provides vim-like keybindings and modal editing. I used to be a Vim user, and I still use it for quick editing, but I love LISP :)
- Good integration with the Language Server Protocol (LSP), provided by `lsp-mode`.
- Debugger support via `dap-mode`.
- Fuzzy finding provided by `helm-mode`.
- Jump-to-reference, find usages, provided by GNU Global + `helm-gtags` and `lsp-goto-type-definition`.
- Project management using `projectile`.
- Project-wide search-and-replace (code written by me). Does not take code semantics into consideration (it's a global regex with a good UI).
- Top-notch window and buffer management (custom key bindings based on `i3-wm`, heavy usage of `helm` and `ibuffer`).
- Tight integration with Git, provided by `magit`.
- `hydra-mode` so all these features are easily accessible.
- A bunch of other things I might have forgotten ;)

#### The following languages are _well-supported_:

- C and C++ (`lsp-mode` is backed by `clangd`)
- Go (`lsp-mode` is backed by `gopls`)
- Python (`lsp-mode` is backed by `pyright`)
- Common LISP (`slime`)
- x86 assembly (Intel syntax)
- RPM spec files
- Ansible YAML

#### The following languages are _supported_, but not that heavily used by me, so support isn't top-notch:

- Java
- C#
- Rust
- Markdown
- PlantUML

#### Installation

1. Clone this repo as your `~/.emacs.d`: `git clone https://github.com/martinjungblut/emacs ~/.emacs.d`
2. Install system-wide dependencies. You'll need the following:
  - `gcc` or `clang`. You'll need a C compiler for vterm support.
  - `clangd`. This is used for C and C++ as the LSP server.
  - `go`. You'll need this to have proper Go support.
  - `npm`. Used to install `pyright`, which is Python's LSP server.
  - `git`.
  - `libvterm.so.0`. This is a good terminal emulation library, and this Emacs config leverages it because I like having some terminals inside Emacs.
  - Install whatever packages provide these binaries and shared object on your Linux/UNIX distribution.
3. Install Golang dependencies: `bash ~/.emacs.d/extra-deps/go.sh`
4. Install `pyright`: `bash ~/.emacs.d/extra-deps/npm.sh`
5. Open Emacs, wait for everything to finish installing.
6. At some point, support for `libvterm` will require some software to be compiled. Answer "yes".
7. You're set!

#### Recommended steps after installation

I strongly suggest that you read `layers/06-key-bindings.el`. All keybindings are defined there.
