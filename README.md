Dwarf Stalker
=============

Dwarf Stalker watches your dwarves so you don't have to. It's written in Ruby for no particular reason. It requires the gems `libnotify` and `rb-inotify`

```
gem install libnotify rb-inotify
```

To use, run file `dwarf-stalker.rb`

Set the path to your dwarf fortress directory in `df_path.txt`. Include trailing slash. `patterns.txt` defines which alerts should be displayed. Every line is a regualar expression. If a pattern in the file is matched by an alert in the gamelog, the alert will be displayed.
