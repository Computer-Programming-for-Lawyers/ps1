#!/bin/bash
# Copy the hooks from git-hooks to .git/hooks and make executable
cp git-hooks/* .git/hooks/ && chmod +x .git/hooks/pre-push