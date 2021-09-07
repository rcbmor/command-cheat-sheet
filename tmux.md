# TMUX

## Sessions
```
tmux
tmux new
tmux new-session
tmux new -s mysession
tmux kill-session -t mysession
tmux kill-session -a
Start a new session: :new
Rename session: Ctrl + b $
Detach from session: Ctrl + b d
tmux ls
tmux list-sessions
Show all sessions: Ctrl + b s
```

## Windows
```
tmux new -s mysession -n mywindow
c  create window
w  list windows
n  next window
p  previous window
f  find window
,  name window
&  kill window
Reorder window, swap window number 2(src) and 1(dst): :swap-window -s 2 -t 1
Move current window to the left by one position: :swap-window -t -1
```

## Panes
```
%  vertical split
"  horizontal split
o  swap panes
q  show pane numbers
x  kill pane
+  break pane into window (e.g. to select text by mouse to copy)
-  restore pane from window
⍽  space - toggle between layouts
<prefix> q (Show pane numbers, when the numbers show up type the key to goto that pane)
<prefix> { (Move the current pane left)
<prefix> } (Move the current pane right)
<prefix> z toggle pane zoom
```

## Copy Mode
```
use vi keys in buffer: :setw -g mode-keys vi
Enter copy mode   Ctrl + b [
Enter copy mode and scroll one page up-arrow Ctrl + b PgUp
Quit mode   q
Clear selection  Esc
Copy selection   Enter
Paste contents of buffer_0   Ctrl + b ]
display buffer_0 contents:  show-buffer
copy entire visible contents of pane to a buffer:  :capture-pane
Show all buffers:  :list-buffers
Show all buffers and paste selected: :choose-buffer
Save buffer contents to buf.txt:  :save-buffer buf.txt
delete buffer_1:  :delete-buffer -b 1
Enter command mode:  Ctrl + b :
```

## Configurations Options:
```
# Mouse support - set to on if you want to use the mouse
* setw -g mode-mouse off
* set -g mouse-select-pane off
* set -g mouse-resize-pane off
* set -g mouse-select-window off

# Set the default terminal mode to 256color mode
set -g default-terminal "screen-256color"

# enable activity alerts
setw -g monitor-activity on
set -g visual-activity on

# Center the window list
set -g status-justify centre

# Maximize and restore a pane
unbind Up bind Up new-window -d -n tmp \; swap-pane -s tmp.1 \; select-window -t tmp
unbind Down
bind Down last-window \; swap-pane -s tmp.1 \; kill-window -t tmp
```
