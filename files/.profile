echo "loading profile..."

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

source ~/.profile-improvements
source ~/.profile-dev
source ~/.profile-ifit

alias update-dotfiles="cd ~/.dotfiles/ && git update && ./install"
alias reset-shell="exec "$SHELL""
alias edit-profile="code --new-window ~/.dotfiles"

alias fin="say Fin"
alias plank="say 'Fin. Good Planking'"

echo "loaded profile."

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
j() {
  if [[ "$#" -ne 0 ]]; then
    cd $(autojump $@)
    return
  fi
  cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)"
}
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
