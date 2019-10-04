#!/usr/bin/env sh

# bar settings
yabai -m config status_bar                   off

# global settff775759ff505050ffd75f5fings
yabai -m config mouse_follows_focus          off
yabai -m config focus_follows_mouse          autofocus
yabai -m config window_opacity               off
yabai -m config window_opacity_duration      0.0
yabai -m config window_shadow                on
yabai -m config window_border                off
yabai -m config window_border_width          4
# yabai -m config active_window_border_color   "#FF000000"
# yabai -m config normal_window_border_color   "#00000000"
# yabai -m config insert_window_border_color   "#00000000"
yabai -m config mouse_modifier               fn
yabai -m config mouse_action1                move
yabai -m config mouse_action2                resize

# general space settings
yabai -m config layout                       float
yabai -m config top_padding                  5
yabai -m config bottom_padding               5
yabai -m config left_padding                 5
yabai -m config right_padding                5
yabai -m config window_gap                   5

echo "yabai configuration loaded.."
