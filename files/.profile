echo "loading profile..."

# slack themes: https://github.com/mykeels/slack-theme-cli
export PATH=$PATH:/Users/pedromass/bin/slack-theme
export SLACK_THEME_SHELL_PROFILE="/Users/pedromass/.zshrc"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

source ~/.profile-improvements
source ~/.profile-dev
source ~/.profile-ifit

alias update-dotfiles="cd ~/.dotfiles/ && git update && ./install"
alias reset-shell="exec "$SHELL""
alias edit-profile="code --new-window ~/.dotfiles"

echo "loaded profile."

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh