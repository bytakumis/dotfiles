if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias vim="nvim"
alias lg="lazygit"
alias ls="exa"
alias ll="exa --icons -l"
alias tree="exa --icons -T"
alias hp=peco_select_history

export ENHANCD_DOT_ARG='...'

# open tmux
function attach_tmux_session_if_needed
    set ID (tmux list-sessions)
    if test -z "$ID"
        tmux new-session
        return
    end

    set new_session "Create New Session" 
    set ID (echo $ID\n$new_session | peco --on-cancel=error | cut -d: -f1)
    if test "$ID" = "$new_session"
        tmux new-session
    else if test -n "$ID"
        tmux attach-session -t "$ID"
    end
end

if test -z $TMUX && status --is-login
    attach_tmux_session_if_needed
end

neofetch


