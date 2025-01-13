#!/bin/zsh
cd $1
for i in {01..25}; do
    echo Day $i
    time ruby $i.rb input/$i
done
