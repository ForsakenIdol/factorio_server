#!/bin/sh

# Run and stop the server once to create the `mods/` folder, then run this script to set up the mods.

# First, start and stop the server to set up the `mods/` folder.
echo "Creating mods folder...";
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
echo "Mod zip downloaded. Unzipping ;)...";
unzip -o ./factorio_mods.zip -d ./factorio/factorio/mods/;


