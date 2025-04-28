#!/bin/sh

# Run this script from the same directory as the setup and teardown scripts.
./factorio/factorio/bin/x64/factorio --start-server ./saves/test-save.zip --server-settings ./server-settings.json

# We can run this in the background with a Linux "screen".
# `screen -S <screen_name>` creates a screen with the name "screen_name".
# `Ctrl+a d` detaches you from the currently-active screen.
# `screen -ls` shows a list of currently-running screens.
# screen -r <screen_id>` resumes control of the screen with ID "screen_id".
# You can delete a screen by exiting from it the same way you exit from a terminal - with `exit`.
