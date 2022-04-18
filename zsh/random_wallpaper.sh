#!/bin/bash
ls ~/wallpapers | sort -R | tail -1 | while read selected; do
    image_path="$HOME/wallpapers/$selected"
    echo "Setting background to $selected (* ^ ω ^).."
    feh --bg-scale "$HOME/wallpapers/$selected"
    # kitty @ set-background-image $image_path
    # echo "background_image $image_path" > "$HOME/code/dotfiles/kitty/background_image.conf"
done

