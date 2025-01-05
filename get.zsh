#!/bin/zsh
mkdir -p $1/input && cd $_
curl https://adventofcode.com/$1/day/{1..25}/input -o{01..25} \
  --cookie "session=${2: -128}"

