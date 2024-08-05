# Template Assignment to List Extensions and Auto-Commit&Push

This repository should serve as a template for GitHub Classroom assignments that want to list the extensions students use and commit & push the students' work every 5 minutes while the Codespace is open and active. Specific features of this repository are noted below.

## Pre-push Hook
The pre-push hook is a script that runs every time a user executes ``git push``.  For the purposes of monitoring which extensions students use in their classroom assignments, the pre-push hook used in this repository will create and push a text file listing all extensions used in vs-code before each push. That file is stored as ``extensions-list.txt`` in the ``git-hooks`` folder.

## Auto-commit Action
This repository includes a shell script ``.devcontainer/scripts/autocommit.sh`` that will automatically commit and push any unsaved changes to the repository from the corresponding Codespace every 5 minutes.

## devcontainer.json postCreateCommand & PostAttachCommand.
``postCreateCommand`` activates the shell script file ``.devcontainer/scripts/setup-hooks.sh`` which copies the pre-push file to the .git/hooks directory. ``postAttachCommand`` activates ``.devcontainer/scripts/start-autocommit.sh`` which initiates the ``autocommit.sh`` file and instructs it to run every 5 minutes. Essentially, these commands active autosave and the extensions-list creation.