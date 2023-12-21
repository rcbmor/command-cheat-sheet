# i3 Window Manager Cheat Sheet

`$mod` refers to the modifier key (window/command or alt by default depending on config)

## General
* `startx i3` start i3 from command line
* `$mod+<Enter>` open a terminal
* `$mod+d` open dmenu (text based program launcher)
* `$mod+r` resize mode (<Esc> or <Enter> to leave resize mode)
* `$mod+shift+e` exit i3
* `$mod+shift+r` restart i3 inplace
* `$mod+shift+c` reload config file
* `$mod+shift+q` kill window (does normal close if application supports it)
* `$mod+space` toggle focus

## Windows
* `$mod+w` tabbed layout
* `$mod+e` vertical and horizontal layout (switches to and between them)
* `$mod+s` stacked layout
* `$mod+f` fullscreen
* `$mod+v` split window vertically 
* `$mod+h` split window horizontally

## Moving Windows
* `$mod+shift+<direction key>` move window in _direction_ (depends on direction keys settings)
* direction keys
  * `j` left
  * `k` down
  * `l` up
  * `;` right

## Floating
 *  `$mod+shift+space` toggle floating
 *  `$mod+mouse` drag floating

## Workspaces 
 *  `$mod+[0-9]` switch to another workspace
 *  `$mod+shift+[0-9]` move a window to another workspace

## Config
 * copy `/etc/i3/config` to `~/.i3/config` (or `~/.config/i3/config`)
