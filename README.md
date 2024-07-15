This project involves creating a shell script named main.sh to automate tasks using shell commands like sed, grep, and awk. The script processes a CSV file named data.csv with columns Name, Age, City, and Salary, performing several operations:

Argument Validation:

Checks if exactly two filenames are provided as arguments. If not, it prints a usage message and exits.
File Existence Check:

Verifies if the input file exists. If it does not, the script generates an error message and exits.
Unique Cities Extraction:

Extracts and writes unique cities from the input file to the output file.
Top 3 Salaries:

Identifies the top 3 individuals with the highest salaries and saves their details (Name, Age, City, Salary) to the output file without overwriting it.
Average Salary Calculation:

Computes the average salary for each city and appends this information to the output file.
Above Average Salary:

Identifies individuals with salaries above the overall average and appends their details to the output file.
The project emphasizes the use of shell scripting for data manipulation and requires careful handling of file operations to avoid overwriting the output file. The script should be well-documented with comments explaining each section of the code.
