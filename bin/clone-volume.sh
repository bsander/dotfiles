#!/bin/bash

# Inspired by https://github.com/gdiepen/docker-convenience-scripts/blob/master/docker_clone_volume.sh

get_volume() {
  if docker volume inspect "$1" > /dev/null 2>&1; then
    echo "$1"
  elif [ -e "$1" ]; then
    echo "$(cd "$(dirname "$1")" || exit; pwd)/$(basename "$1")"
  else
    echo "The destination volume \"$1\" does not exist"
    exit 1
  fi
}

FROM=$(get_volume "$1")
TO=$(get_volume "$2")

echo "Copying data from source volume \"$FROM\" to destination volume \"$TO\"..."

set -x
docker run --rm -it \
  -v "$FROM":/from \
  -v "$TO":/to \
  alpine ash -c "cd /from ; cp -av . /to"
