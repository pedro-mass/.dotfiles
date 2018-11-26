echo "loading profile..."

# slack themes: https://github.com/mykeels/slack-theme-cli
export PATH=$PATH:/Users/personal/slack-themes

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

source ~/.profile-improvements
source ~/.profile-dev
source ~/.profile-ifit
source ~/.profile-secret

alias update-dotfiles="cd ~/.dotfiles/ && git update && ./install"
alias reset-shell="exec "$SHELL""
alias edit-profile="code --new-window ~/.dotfiles"

echo "loaded profile."
