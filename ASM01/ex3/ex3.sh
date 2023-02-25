#!/bin/bash

df_output=$(df)
echo "$df_output" > df_file.txt
echo "List of file systems"
all_file_system=$(cut -d ' ' -f 1 df_file.txt)
echo $all_file_system

selected_file_system=""
while IFS= read -r line; do
    IFS=' ' read -ra split_line <<< "$line"
    use_string=${split_line[4]}
    use=$(tr -d "\\%" <<< "$use_string")
    if [[ use -gt 20 ]]; then
        selected_file_system+="${split_line[0]}"
        # echo $line
    fi
done <<< "$df_output"
echo "Filesystem $selected_file_system has less than 80% free space"