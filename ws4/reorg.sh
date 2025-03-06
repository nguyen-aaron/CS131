#!/bin/bash

# Get current date
DATE=$(date "+%F-%T")

# Create list of vendor IDs
VENDORS=(1.0 2.0 4.0)

# Loop through vendor list and create CSV files
for VENDOR in "${VENDORS[@]}"; do
        echo "Processing $VENDOR"
        FILE="${DATE}-${VENDOR}.csv"
        grep "^$VENDOR," "2019-01-h1.csv" > "$FILE"
        echo "Finished with $VENDOR"
done

for VENDOR in "${VENDORS[@]}"; do
    echo "${DATE}-${VENDOR}.csv" >> .gitignore
done

# Get word count of all files and put output to ws4.txt
wc "${DATE}"-*.csv > ws4.txt

# Also, ws4.txt should have the result of "cat .gitignore"
cat .gitignore >> ws4.txt
