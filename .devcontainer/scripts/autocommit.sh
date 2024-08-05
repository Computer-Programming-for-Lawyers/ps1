#!/bin/bash
DRY_RUN=false
if [[ "$1" == "--dry-run" ]]; then
    DRY_RUN=true
fi

# Navigate to the root directory of the repository
cd "$(git rev-parse --show-toplevel)"

# Update local repository information, suppressing output
git fetch origin > /dev/null 2>&1

# Check if local is behind remote
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse @{u})

if [ "$LOCAL" != "$REMOTE" ]; then
    echo "Local branch (codespaces) is out of sync with the remote branch (github repository). Autosave failed."
    exit 1  # Exit with a non-zero status to indicate failure
else
    # echo "Local branch is up-to-date with the remote branch."
    # Check for changes
    if git diff-index --quiet HEAD --; then
        # echo "No changes to commit."
        #continue
        exit 0  # Exit with a zero status to indicate success
    else
        # Add all changes to the staging area
        git add -A

        # Commit the changes
        git commit -m "Auto-commit changes"

        # Push the changes to the repository
        git push origin main
        
        exit 0  # Exit with a zero status to indicate success
    fi
fi