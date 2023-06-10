# Path: homebrew
set PATH /opt/homebrew/bin $PATH
set PATH $HOME/Library/Python/3.8/bin $PATH
set -x GOPATH $HOME/go
set -x GOROOT /opt/homebrew/Cellar/go@1.16/1.16.15/libexec
set -x GOTOOLDIR /opt/homebrew/Cellar/go@1.16/1.16.15/libexec/pkg/tool/darwin_arm64
set -x PATH $GOPATH/bin $PATH
set -x PATH /opt/homebrew/var/nodebrew/current/bin $PATH
set -x NODEBREW_ROOT /opt/homebrew/var/nodebrew


if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias vim="nvim"
alias lg="lazygit"
alias ls="exa"
alias ll="exa --icons -l"
alias tree="exa --icons -T"
alias hp=peco_select_history
alias cdp=cd_by_peco_on_current_dir
alias cdpr=cd_by_peco_on_root_dir
alias vimp=vim_by_peco_on_current_dir
alias vimpr=vim_by_peco_on_root_dir

export ENHANCD_DOT_ARG='...'

# -----------------------------------
# cd by peco on current directory
# -----------------------------------
function cd_by_peco_on_current_dir
  set selected_dir (fd . -t d -H | peco)
  if [ $selected_dir ]
    cd $selected_dir
    echo cd $selected_dir
    commandline -f repaint
  end
end

# -----------------------------------
# cd by peco on root direcotry
# -----------------------------------
function cd_by_peco_on_root_dir
  set home_dir (realpath ~)
  set selected_dir (fd . $home_dir -t d -H | peco)
  if [ $selected_dir ]
    cd $selected_dir
    echo cd $selected_dir
    commandline -f repaint
  end
end

# -----------------------------------
# vim by peco on current directory
# -----------------------------------
function vim_by_peco_on_current_dir
  set selected_dir (fd . -t f -H | peco)
  if [ $selected_dir ]
    vim $selected_dir
    echo vim $selected_dir
    commandline -f repaint
  end
end

# -----------------------------------
# vim by peco on root direcotry
# -----------------------------------
function vim_by_peco_on_root_dir
  set home_dir (realpath ~)
  set selected_dir (fd . $home_dir -t f -H | peco)
  if [ $selected_dir ]
    vim $selected_dir
    echo vim $selected_dir
    commandline -f repaint
  end
end

# tmux popup
function tmuxpopup -d "toggle tmux popup window"
  set width '90%'
  set height '90%'
  set session (tmux display-message -p -F "#{session_name}")
  if contains "popup" $session
    tmux detach-client
  else
    tmux popup -d '#{pane_current_path}' -xC -yC -w$width -h$height -E "tmux attach -t popup || tmux new -s popup"
  end
end

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

