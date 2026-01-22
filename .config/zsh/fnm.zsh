# fnm
FNM_PATH="/home/arvind/.config/local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env --use-on-cd --version-file-strategy=recursive --shell zsh`"
fi
