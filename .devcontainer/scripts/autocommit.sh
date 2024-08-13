#!/bin/bash
DRY_RUN=false
if [[ "$1" == "--dry-run" ]]; then
    DRY_RUN=true
fi

# Navigate to the root directory of the repository
cd "$(git rev-parse --show-toplevel)"

# Update local repository information, suppressing output
git fetch origin > /dev/null 2>&1

# Check if local is behind, ahead, or diverged from remote
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base HEAD @{u})

if [ "$LOCAL" = "$REMOTE" ]; then
    # Local branch is up-to-date with the remote branch.
    if git diff-index --quiet HEAD --; then
        # No changes to commit.
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
elif [ "$REMOTE" = "$BASE" ]; then
    echo "Local branch is ahead of the remote branch. Auto-committing and pushing changes."
    # Add all changes to the staging area
    git add -A

    # Commit the changes
    git commit -m "Auto-commit changes"

    # Push the changes to the repository
    git push origin main
    
    exit 0  # Exit with a zero status to indicate success
else
    # Local branch is either behind or diverged, but we proceed without error.
    echo "Local branch is either behind the remote branch or has diverged. Skipping push to avoid conflicts."
    exit 0  # Exit with a zero status to indicate success, but no push occurs.
fi