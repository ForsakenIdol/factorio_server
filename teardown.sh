#!/bin/sh

# Environment Variables
FACTORIO_ZIP_NAME=factorio-server-headless.tar.xz

# Tear down the Factorio server and clean up everything
echo "Teardown called.";

# Delete the mod zip.
echo "Deleting the mod zip archive...";
rm -rf factorio_mods.zip;

# Ideally, we would do any backups before teardown, or before removing the unzipped factorio server files.
# Currently, there are no such backups we need to perform.
echo "Removing the unzipped Factorio server files...";
rm -rf factorio/factorio;

echo "Removing Factorio server zip...";
rm -rf factorio/$FACTORIO_ZIP_NAME;

echo "Removing \"factorio\" folder, this should be completely empty now...";
rmdir factorio;
