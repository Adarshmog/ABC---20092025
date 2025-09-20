#!/bin/bash
#author - Adarsh


val=$1
path="/home/adarshmoger/maxiscript"

if [ "$val" = "1" ]; then
  mkdir -p "$path"
  echo "sample file" > "$path/adarsh.txt"
  echo "created $path"
elif [ "$val" = "0" ]; then
  rm -rf "$path"
  echo "removed $path"
else
  echo "use 0 or 1"
fi

