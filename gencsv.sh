#!/bin/bash

# Check if two arguments are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <start_index> <end_index>"
    exit 1
fi

# Assign arguments to variables
start=$1
end=$2

# Validate that both arguments are integers
if ! [[ "$start" =~ ^-?[0-9]+$ && "$end" =~ ^-?[0-9]+$ ]]; then
    echo "Error: Both arguments must be integers."
    exit 1
fi

# Validate that start index is less than or equal to end index
if [ "$start" -gt "$end" ]; then
    echo "Error: Start index must be less than or equal to end index."
    exit 1
fi

# Create the file and populate it with the required data
output_file="inputFile"
> "$output_file"

for ((i=start; i<=end; i++)); do
    random_number=$((RANDOM))
    echo "$i, $random_number" >> "$output_file"
done

echo "File '$output_file' generated successfully with entries from $start to $end."

