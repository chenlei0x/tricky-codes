#!/bin/bash
## declare an array variable
declare -a array=("one" "two" "three")

# get length of an array
arraylength=${#array[@]}

# use for loop to read all values and indexes
for (( i=0; i<${arraylength}; i++ ));
do
  echo $i ": " ${array[$i-1]}
done

for i in "${array[@]}"
do
   echo "$i"
   # or do whatever with individual element of the array
done
