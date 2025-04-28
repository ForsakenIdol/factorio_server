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

cd ..

# Time to load mods.
echo "Time to load mods. We need to start and stop the server once to create the mods/ folder...";
# Piping stdout to null prevents it from crashing with an empty STDIN error.
./factorio/factorio/bin/x64/factorio --start-server ./saves/test-save.zip --server-settings ./server-settings.json 1>/dev/null &
FACTORIO_PID=$!
echo "Factorio process sent to background. PID $FACTORIO_PID...";
sleep 5;
echo "Stopping server...";
kill $FACTORIO_PID;

# First, download the mods as a zip.
echo "Downloading mod zip...";
curl "https://cdn.discordapp.com/attachments/427068629486534667/1366410416057618564/factorio_mods.zip?ex=6810d85d&is=680f86dd&hm=777e92924a7a367050e37c7153f1f5d19dbad28f40eadcce48d5769bff8ef1b4&" --output factorio_mods.zip;
echo "Mod zip downloaded, unzipping...";
unzip -o ./factorio_mods.zip -d ./factorio/factorio/mods/;
