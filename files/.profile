echo "loading profile..."

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

source ~/.profile-improvements
source ~/.profile-dev
source ~/.profile-ifit

alias update-dotfiles="cd ~/.dotfiles/ && git update && ./install"
alias reset-shell="exec "$SHELL""
alias edit-profile="code --new-window ~/.dotfiles"
alias edit-shell="edit-profile"

alias fin="say Fin"
alias plank="say 'Fin. Good Planking'"

echo "loaded profile."

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
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
alias f="fzf --preview 'bat --style=numbers --color=always {}' --preview-window right:60%"


# GIT heart FZF: https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236
# -------------

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% "$@" --border
}

# gf() {
#   is_in_git_repo || return
#   git -c color.status=always status --short |
#   fzf-down -m --ansi --nth 2..,.. \
#     --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
#   cut -c4- | sed 's/.* -> //'
# }

# gb() {
#   is_in_git_repo || return
#   git branch -a --color=always | grep -v '/HEAD\s' | sort |
#   fzf-down --ansi --multi --tac --preview-window right:70% \
#     --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
#   sed 's/^..//' | cut -d' ' -f1 |
#   sed 's#^remotes/##'
# }

# gt() {
#   is_in_git_repo || return
#   git tag --sort -version:refname |
#   fzf-down --multi --preview-window right:70% \
#     --preview 'git show --color=always {} | head -'$LINES
# }

# gh() {
#   is_in_git_repo || return
#   git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
#   fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
#     --header 'Press CTRL-S to toggle sort' \
#     --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
#   grep -o "[a-f0-9]\{7,\}"
# }

# gr() {
#   is_in_git_repo || return
#   git remote -v | awk '{print $1 "\t" $2}' | uniq |
#   fzf-down --tac \
#     --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
#   cut -d$'\t' -f1
# }
