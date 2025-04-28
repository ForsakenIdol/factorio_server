#!/bin/sh

# Generates a map for the headless server to use.
echo "Generating world...";
../factorio/factorio/bin/x64/factorio --create ../saves/a_world.zip --map-gen-settings map-gen-settings.json --map-settings map-settings.json;

