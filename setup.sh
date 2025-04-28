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
echo "Unpacking zip..."
tar -xJf $FACTORIO_ZIP_NAME
