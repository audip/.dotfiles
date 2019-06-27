# Development toolkit

My Mac development kit covers vim, zsh, iterm and pathogen.

## Installation

1. Install vim with brew: `brew install vim`
2. Clone the repo: `git clone https://github.com/audip/dotfiles.git`
3. Create symlinks for files in `~/.dotfiles` folder: `ln  -s source destination` for .zshrc, .vimrc, .vim, .tmux.conf, .zprofile, .profile and oh-my-zsh (~/.oh-my-zsh) 
4. Install oh-my-zsh & tmux.
5. Change user to default user in `.dotfiles/.zshrc`
6. Syntax highlighting: brew install zsh-syntax-highlighting

## Useful Tools

*Keeping apps up-to-dat*
- [brew cu](https://github.com/buo/homebrew-cask-upgrade) to auto upgrade all [Brew Cask](https://github.com/Homebrew/homebrew-cask) applications.
- [mas](https://github.com/mas-cli/mas) to keep Mac App Store apps updated
- `brewup` to update brew CLI apps, used as an alias: `brew update && brew upgrade && brew cleanup` 


## References
https://gist.github.com/kevin-smets/8568070
