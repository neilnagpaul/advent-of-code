#!/bin/sh
mkdir -p $1/input && cd $_
curl -o "#1" "https://adventofcode.com/$1/day/[1-25]/input" \
  --cookie "session=$2"
