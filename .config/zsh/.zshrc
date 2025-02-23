setopt AUTO_PUSHD                # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS         # Do not store duplicates in the stack.
setopt PUSHD_SILENT              # Do not print the directory stack after pushd or popd.

setopt CORRECT                   # Spelling correction
setopt CDABLE_VARS               # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB             # Use extended globbing syntax.
setopt LONGLISTJOBS              # Display PID when suspending processes as well
setopt NOTIFY                    # Report the status of backgrounds jobs immediately
setopt HASH_LIST_ALL             # Whenever a command completion is attempted, make sure the entire command path is hashed first.
setopt COMPLETEINWORD            # Not just at the end

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

REPORTTIME=5
bindkey -e

fpath=($ZDOTDIR/plugins $fpath)

source $ZDOTDIR/plugins/zsh-history-substring-search.zsh
source $ZDOTDIR/plugins/completion.zsh

source $ZDOTDIR/prompt.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/pnpm.zsh
source $ZDOTDIR/fnm.zsh

eval "$(dircolors -b $ZDOTDIR/dircolors.zsh)"
