#!/bin/bash

# Thanks to https://stackoverflow.com/a/246128
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/../"

cd $PROJECT_DIR
PROJECT_DIR="$(pwd)"

if [ ! -d "$1" ]; then
  echo "Directory $PROJECT_DIR/$1 does not exist"
  exit
fi

while read line; do
    "$PROJECT_DIR/bin/symlink_joomla_dir_to_src.sh" "$line" "$PROJECT_DIR/$1"
done < "$PROJECT_DIR/configs/src_mapping.txt"

echo "*****************"
echo "Symlinks created for $1!"
echo "*****************"
