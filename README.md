Dwarf Stalker
=============

Dwarf Stalker watches your dwarves so you don't have to. It's written in Ruby for no particular reason.

## Installation

the gems `libnotify` and `rb-inotify` are required

```
gem install libnotify rb-inotify
```
## Configuration

Set the path to your dwarf fortress directory in a file named `df_path.txt`. Include trailing slash. `patterns.txt` defines which alerts should be displayed. Every line is a regualar expression. If a pattern in the file is matched by an alert in the gamelog, the alert will be displayed.

## Use

```
ruby dwarf-stalker.rb
```
