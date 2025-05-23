#!/bin/sh

# Environment Variables
FACTORIO_ZIP_NAME=factorio-server-headless.tar.xz

# Tear down the Factorio server and clean up everything
echo "Teardown called.";

# Ideally, we would do any backups before teardown, or before removing the unzipped factorio server files.
# Currently, there are no such backups we need to perform.
echo "Removing the unzipped Factorio server files...";
rm -rf factorio/factorio;

echo "Removing \"factorio\" folder, this should be completely empty now...";
rmdir factorio;
