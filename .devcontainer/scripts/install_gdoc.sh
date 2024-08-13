#!/bin/bash
code --install-extension vsls-contrib.gitdoc
code --command "GitDoc: Enable"


# Adjust GitDoc to auto-commit every 5 minutes
settings_path="$HOME/.config/Code/User/settings.json"

# Ensure settings.json exists
mkdir -p "$(dirname "$settings_path")"
touch "$settings_path"

# Add or update the autoCommitDelay setting
jq '.["gitdoc.autoCommitDelay"] = 300' "$settings_path" > tmp.$$.json && mv tmp.$$.json "$settings_path"