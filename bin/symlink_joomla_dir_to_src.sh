#!/bin/bash

# Thanks to https://stackoverflow.com/a/246128
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/../"

cd $PROJECT_DIR
PROJECT_DIR="$(pwd)"

SRC_DIR=$1
JOOMLA_PATH="$2/$SRC_DIR"
DESTINATION=$( dirname "$JOOMLA_PATH" )
BIN_DIR=$PROJECT_DIR/bin

rm -fR $JOOMLA_PATH
RELATIVE_PATH=$(php $BIN_DIR/get_relative_path.php "$PROJECT_DIR/src/$SRC_DIR" "$DESTINATION")
cd $DESTINATION
ln -s  "$RELATIVE_PATH" "$JOOMLA_PATH"
