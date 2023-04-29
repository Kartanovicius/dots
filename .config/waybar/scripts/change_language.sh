#!/bin/sh

# Define an array of languages with corresponding keymaps
declare -a languages=("English (US)=us" "Lithuanian=lt" "Czech=cz" "Russian=ru")

# Get the current keymap
current_keymap=$(swaymsg -t get_inputs | jq '.[] | select(.identifier == "1:1:AT_Translated_Set_2_keyboard") | .xkb_active_layout_name' | tr -d '\"')

# Find the index of the current keymap in the languages array
for i in "${!languages[@]}"; do
    if [[ "${languages[$i]}" == *"$current_keymap"* ]]; then
        current_language_index=$i
    fi
done

# Select the next language in the array
next_language_index=$(( (current_language_index + 1) % ${#languages[@]} ))
next_keymap="${languages[$next_language_index]#*=}"

# Switch to the next keymap
swaymsg input "1:1:AT_Translated_Set_2_keyboard" xkb_layout "$next_keymap"
echo "Keyboard layout switched to $next_keymap."

pkill -RTMIN+1 waybar