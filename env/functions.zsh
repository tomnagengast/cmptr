# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_"
}

# Copy the current working directory to the clipboard
function cpwd() {
  pwd | tr / _
}

function gs() {
  # if the function is called with no arguments, run `gss`
  if [ $# -eq 0 ]; then
    git status --short
  else
    /opt/homebrew/bin/gs $@
  fi
}

# function git() {
#   # when checking out a branch, also write the git repo and the branch to ~/.gitbranches
#   if [[ $1 == "checkout" ]]; then
#     command git $@
#     if [[ $? -eq 0 ]]; then
#       local git_repo=$(git rev-parse --show-toplevel)
#       local git_branch=$(git rev-parse --abbrev-ref HEAD)
#       echo "$git_repo $git_branch" >> ~/.gitbranches
#     fi
#   else
#     command git $@
#   fi
# }

function ggo() {
  git checkout -b "$1" 2> /dev/null || git checkout "$1"
}

function uturn() {
  local current_repo=$(git rev-parse --show-toplevel)
  local current_branch=$(git rev-parse --abbrev-ref HEAD)
  local last_branch=""

  # Read ~/.gitbranches in reverse order to find the last branch for the current repo
  while read -r line; do
    local line_repo=$(echo "$line" | awk '{print $1}')
    local line_branch=$(echo "$line" | awk '{print $2}')

    if [[ "$line_repo" == "$current_repo" && "$line_branch" != "$current_branch" ]]; then
      last_branch=$line_branch
      break
    fi
  done < <(tac ~/.gitbranches)

  if [[ -n $last_branch ]]; then
    git checkout $last_branch
  else
    echo "No previous branch found for this repository."
  fi
}

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

# Determine size of a file or total size of a directory
function fs() {
  if du -b /dev/null >/dev/null 2>&1; then
    local arg=-sbh
  else
    local arg=-sh
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@"
  else
    du $arg .[^.]* ./*
  fi
}

# Create a data URL from a file
function dataurl() {
  local mimeType=$(file -b --mime-type "$1")
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8"
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# `o` with no arguments opens the current directory, otherwise opens the given location
function o() {
  if [ $# -eq 0 ]; then
    open .
  else
    open "$@"
  fi
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
  tree -aC -I '.git|node_modules|vendor' --dirsfirst "$@" | less -FRNX
}

function gen_model() {
    model_names_json=$(printf '"%s",' "$@" | sed 's/,$//')
    dbt run-operation generate_model_yaml --args "{\"model_names\": [$model_names_json]}"
}

function ni() {
  nix shell nixpkgs#$@
}
