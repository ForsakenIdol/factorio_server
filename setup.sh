#!/bin/sh

# Remind user to run teardown if not already done
echo "Did you remember to tear down any previous Factorio configuration? Proceeding with install in 5 seconds." && sleep 5;

# Environment Variables
FACTORIO_ZIP_NAME=factorio-server-headless.tar.xz
SERVER_VERSION=2.0.32

# Set up the Factorio server

echo "Called ./setup.sh. Downloading headless Factorio server for Linux into its own folder...";
mkdir factorio &&  cd factorio
curl -L https://www.factorio.com/get-download/{$SERVER_VERSION}/headless/linux64 --output $FACTORIO_ZIP_NAME;

# Unpack server
echo "Unpacking zip...";
tar -xJf $FACTORIO_ZIP_NAME;

# We do the funny and disable user verification so that pirated copies can connect (teehee)
echo "Configuring server settings file (server-settings.json)...";
cat << EOF > ./server-settings.json
{
  "name": "A Server for Factorio",
  "description": "Very original name, I know. Fuck off if you don't know what it references.",

  "_comment_max_players": "Maximum number of players allowed, admins can join even a full server. 0 means unlimited.",
  "max_players": 0,

  "_comment_visibility": [
    "public: Game will be published on the official Factorio matching server",
    "lan: Game will be broadcast on LAN"
  ],
  "visibility": {
    "public": false,
    "lan": true
  },

  "game_password": "aserver",

  "_comment_require_user_verification": "When set to true, the server will only allow clients that have a valid Factorio.com account",
  "require_user_verification": false
}
EOF

# At this point, we need a save file to start the headless server.
# We would typically download one from an external backup location, but we don't have such a save file at present.
# Therefore, proceeding with no custom save file, and creating a test save file (zip) instead.
echo "Creating a new test save file...";
./factorio/bin/x64/factorio --create ./saves/test-save.zip;

# Save file has been created, all that is left to do is to start the server.
# The command to do so, from this directory containing the setup script, is as follows:
# ./factorio/factorio/bin/x64/factorio --start-server ./factorio/saves/test-save.zip --server-settings ./factorio/server-settings.json

