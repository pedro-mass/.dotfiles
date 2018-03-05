echo "loading profile..."

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

source ~/.profile-improvements
source ~/.profile-dev
source ~/.profile-ifit
source ~/.profile-secret

alias update-dotfiles="~/.dotfiles/install"
alias reset-shell="exec "$SHELL""

echo "loaded profile."
