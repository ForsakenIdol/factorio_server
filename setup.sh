#!/bin/sh

# Remind user to run teardown if not already done
echo "Did you remember to tear down any previous Factorio configuration? Proceeding with install in 5 seconds." && sleep 5;

# Environment Variables
FACTORIO_ZIP_NAME=factorio-server-headless.tar.xz
SERVER_VERSION=2.0.32

# Set up the Factorio server

echo "Called ./setup.sh. Downloading headless Factorio server for Linux into its own folder...";
mkdir factorio && cd factorio
curl -L https://www.factorio.com/get-download/{$SERVER_VERSION}/headless/linux64 --output $FACTORIO_ZIP_NAME;

# Unpack server
echo "Unpacking zip...";
tar -xJf $FACTORIO_ZIP_NAME;

echo "Server unpacked. Ready to start headless server instance.";

# At this point, we need a save file to start the headless server.
# We would typically download one from an external backup location, but we don't have such a save file at present.
# Let's use a test save file that would be generated using the command below in the same directory as the setup script.
# ./factorio/factorio/bin/x64/factorio --create ./saves/test-save.zip

# Save file has been created, all that is left to do is to start the server.
# The command to do so, from this directory containing the setup script, is as follows:
# ./factorio/factorio/bin/x64/factorio --start-server ./saves/test-save.zip --server-settings ./server-settings.json

