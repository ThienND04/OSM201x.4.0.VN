#!/bin/bash

# read file_name
file_name="$1"
output_file="output.txt"

# clear output.txt
> $output_file
read n

count=1
while IFS= read line; do
    if [ $(($count % 2)) == 0 ]; then
        echo $line >> output.txt
    fi
    if [ $count -gt $n ]; then
        echo $line
    fi
    count=$(($count+1))
done < $file_name