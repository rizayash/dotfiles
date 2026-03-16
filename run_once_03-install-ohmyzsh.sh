#!/bin/bash
# Install Oh My Zsh if not present
# chezmoi: run_once

set -e

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "Installing Oh My Zsh..."
    # Install without changing shell or running zsh (we'll handle that)
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh already installed, skipping."
fi
