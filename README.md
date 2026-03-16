# dotfiles

Personal macOS dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Fresh machine setup

```sh
# 1. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# 2. Install chezmoi and apply dotfiles
brew install chezmoi
chezmoi init --apply rizayash
```

That's it. chezmoi will:
- Prompt for your name, email, and GitHub username
- Install all Homebrew packages from `Brewfile`
- Install Oh My Zsh
- Apply macOS system defaults
- Symlink all dotfiles into place

## What's managed

| File | Purpose |
|------|---------|
| `dot_zshrc` | Zsh config (Oh My Zsh, plugins, PATH) |
| `dot_zprofile` | Homebrew shellenv |
| `dot_gitconfig.tmpl` | Git config (name/email from chezmoi template) |
| `dot_gitignore_global` | Global git ignores |
| `dot_ssh/config` | SSH host configuration |
| `dot_config/zed/settings.json` | Zed editor settings |
| `dot_config/gh/config.yml` | GitHub CLI config |
| `Brewfile` | All Homebrew packages and casks |

## Keeping things updated

```sh
# Edit a managed file
chezmoi edit ~/.zshrc

# Pull latest from GitHub and apply
chezmoi update

# Add a new file to tracking
chezmoi add ~/.config/some/config

# Push changes to GitHub
cd $(chezmoi source-path) && git add -A && git commit -m "..." && git push
```

## Notes

- `~/.config/chezmoi/chezmoi.toml` holds your personal data (name, email) — this lives only on your machine, not in git
- `~/.config/gh/hosts.yml` is intentionally excluded (contains auth tokens)
- SSH private keys are never tracked — only `~/.ssh/config`
