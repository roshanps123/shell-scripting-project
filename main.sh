#!/bin/bash

# Defined filenames
inputCSV="data.csv"
outputTXT="output.txt"

# Confirming input file existence
if [ ! -f "$inputCSV" ]; then
    echo "Error: The file $inputCSV is not found."
    exit 1
fi

# Initialize the output file
: > "$outputTXT"

# Getting unique city names
echo "------------------" >> "$outputTXT"
echo "List of Unique Cities:" >> "$outputTXT"
awk -F, 'NR>1 && !citySeen[$3]++ {print $3}' "$inputCSV" | sort | uniq >> "$outputTXT"

# Top three high earners
echo "------------------" >> "$outputTXT"
echo "Top Three Salaries:" >> "$outputTXT"
awk -F, 'NR>1 {print}' "$inputCSV" | sort -t, -k4,4nr | head -3 >> "$outputTXT"

# Average salary by city
echo "------------------" >> "$outputTXT"
echo "City-wise Average Salary:" >> "$outputTXT"
awk -F, 'NR>1 {cityTotal[$3]+=$4; cityCount[$3]++} END {for (c in cityTotal) print "City: " c ", Avg Salary: " cityTotal[c]/cityCount[c]}' "$inputCSV" | sort >> "$outputTXT"

# Individuals earning above the overall average
echo "------------------" >> "$outputTXT"
echo "Individuals Earning Above Average:" >> "$outputTXT"
awk -F, '
    NR>1 {totalSalary+=$4; totalPeople++}
    NR>1 {personData[NR]=$0; personSalary[NR]=$4}
    END {
        averageSalary = totalSalary / totalPeople
        for (i in personData) {
            if (personSalary[i] > averageSalary) {
                split(personData[i], personDetails, ",")
                printf("%s %s %s %s\n", personDetails[1], personDetails[2], personDetails[3], personDetails[4]);
            }
        }
    }' "$inputCSV" | sort -t, -k4,4nr >> "$outputTXT"

# Showing results in console
echo "------------------"
echo "Results are in $outputTXT"
cat "$outputTXT"