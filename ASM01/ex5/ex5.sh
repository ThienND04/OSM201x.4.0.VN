#!/bin/bash

readonly output_file="final_ex5.txt"
# clear output_file
> $output_file


file_names=("pre_a_exp5.txt" "pre_b_exp5.txt" "pre_c_exp5.txt")

total_fail=0
total_pass=0
total_notcheck=0
sums=()

count=0

for file_name in "${file_names[@]}"; do
    a=$(cut -d " " -f2 $file_name --output-delimiter=" ")
    b=$(echo $a)
    IFS=" " read -ra arr <<< $b
    total_fail=$(($total_fail + ${arr[0]}))
    total_pass=$(($total_pass + ${arr[1]}))
    total_notcheck=$(($total_notcheck + ${arr[2]}))
    sum=$((${arr[0]} + ${arr[1]} + ${arr[2]}))
    sums+=($sum)

    count=$(($count + 1))
done

echo "FAIL: $total_fail" >> $output_file
echo "PASS: $total_pass" >> $output_file
echo "NOTCHECK: $total_notcheck" >> $output_file

echo "*****" >> $output_file

echo "SUM1: ${sums[0]}" >> $output_file
echo "SUM2: ${sums[1]}" >> $output_file
echo "SUM3: ${sums[2]}" >> $output_file