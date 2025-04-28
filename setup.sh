#!/bin/sh

# Remind user to run teardown if not already done
echo "Did you remember to tear down any previous Factorio configuration? Proceeding with install in 5 seconds." && sleep 5;

# Environment Variables
FACTORIO_ZIP_NAME=factorio-server-headless.tar.xz

# Set up the Factorio server

echo "Called ./setup.sh. Downloading headless Factorio server for Linux into its own folder...";
mkdir factorio &&  cd factorio
curl -L https://www.factorio.com/get-download/2.0.43/headless/linux64 --output $FACTORIO_ZIP_NAME;

# Unpack server
echo "Unpacking zip...";
tar -xJf $FACTORIO_ZIP_NAME;

# At this point, we need a save file to start the headless server.
# We would typically download one from an external backup location, but we don't have such a save file at present.
# Therefore, proceeding with no custom save file, and creating a test save file (zip) instead.
echo "Creating a new test save file...";
./factorio/bin/x64/factorio --create ./saves/test-save.zip;

# Save file has been created, all that is left to do is to start the server.
