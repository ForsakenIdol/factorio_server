#!/bin/sh

# Environment Variables
SERVER_VERSION=2.0.32
FACTORIO_MODS_ZIP="https://cdn.discordapp.com/attachments/427068629486534667/1366410416057618564/factorio_mods.zip?ex=6810d85d&is=680f86dd&hm=777e92924a7a367050e37c7153f1f5d19dbad28f40eadcce48d5769bff8ef1b4&"

FACTORIO_ZIP_NAME=factorio-server-headless.tar.xz
FACTORIO_SERVER_DOWNLOAD=https://www.factorio.com/get-download/{$SERVER_VERSION}/headless/linux64

# Remind user to run teardown if not already done
echo "Did you remember to tear down any previous Factorio configuration? Proceeding with install in 5 seconds." && sleep 5;

# Set up the Factorio server

echo "Called ./setup.sh. Downloading headless Factorio server for Linux into its own folder...";
mkdir factorio && cd factorio
curl -L $FACTORIO_SERVER_DOWNLOAD --output $FACTORIO_ZIP_NAME;

# Unpack server
echo "Unpacking zip...";
tar -xJf $FACTORIO_ZIP_NAME;
# We don't need the Factorio zip bundle once it's been unpacked, so we can delete it to free up space.
echo "Factorio server zip has been unpacked. Zip no longer required. Removing zip...";
rm -rf $FACTORIO_ZIP_NAME;
echo "Server unpacked. Ready to start headless server instance.";

# At this point, we need a save file to start the headless server. One should already be available.

cd ..

# Time to load mods.
echo "Time to load mods. We need to start and stop the server once to create the mods/ folder...";
# Piping stdout to null prevents it from crashing with an empty STDIN error when we run the server in the background.
./factorio/factorio/bin/x64/factorio --start-server ./saves/test-save.zip --server-settings ./server-settings.json 1>/dev/null &
FACTORIO_PID=$!
echo "Factorio process sent to background, PID $FACTORIO_PID. Sleeping...";
sleep 5;
echo "Stopping server...";
kill $FACTORIO_PID;

# First, download the mods as a zip.
echo "Downloading mod zip...";
curl $FACTORIO_MODS_ZIP --output factorio_mods.zip;
echo "Mod zip downloaded, unzipping...";
unzip -o ./factorio_mods.zip -d ./factorio/factorio/mods/;
echo "Mod loading complete. Mod zip no-longer required; deleting mod zip...";
rm -rf factorio_mods.zip;

echo "Server setup complete. You can now start the server.";
