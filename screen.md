# Screen terminal multiplexer

### Basic commands
```
screen -ls
screen -S session_name
screen -r # reattach

Ctrl+a c Create a new window (with shell).
Ctrl+a " List all windows.
Ctrl+a 0 Switch to window 0 (by number).
Ctrl+a A Rename the current window.

Ctrl+a Ctrl+a Toggle between the current and previous windows

Ctrl+a S Split current region horizontally into two regions.
Ctrl+a | Split current region vertically into two regions.
Ctrl+a tab Switch the input focus to the next region.
Ctrl+a Q Close all regions but the current one.
Ctrl+a X Close the current region.

Ctrl+a d Detach from Linux Screen Session

```
### Initialization
```
~/.screenrc
# Customize the status line
hardstatus alwayslastline
hardstatus string '%{= kG}[ %{G}%H %{g}][%= %{= kw}%?%-Lw%?%{r}(%{W}%n*%f%t%?(%u)%?%{r})%{w}%?%+Lw%?%?%= %{g}][%{B} %m-%d %{W}%c %{g}]'%
```
