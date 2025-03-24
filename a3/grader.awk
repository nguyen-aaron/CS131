#!/usr/bin/awk -f

#This is my user-defined function to calculate the average
function calculate_average(total, count)
{
	return total/count;
}

#Set field seperator to "," (csv file)
BEGIN {
	FS=","
}

#Skip over header
NR == 1 {
	next
}

{
	name = $2
	total = 0
	count = NF - 2

	for (i = 3; i <= NF; i++)
	{
		total +=  $i
	}

	average = calculate_average(total, count)
	
	if (average >= 70)
	{
		result = "Pass" 
	}
	else
	{
		result = "Fail"
	}

	total_array[name] = total
	average_array[name] = average
	result_array[name] = result

	if (NR == 2)
	{
		max_score = total
		min_score = total
		top_student = name
		worst_student = name
	}

	if (total > max_score)
	{
		max_score = total
		top_student = name
	}

	if ( total < min_score)
	{
                min_score = total
                worst_student = name
        }
}

END {
	print "Student Name | Total Score | Average Score | Status"

	for (student in total_array)
	{
		printf "%-13s | %-13d | %13.2f | %6s \n", student, total_array[student], average_array[student], result_array[student]
	}
	
	print ""
	print "Top Student:   " top_student " scored " max_score
	print "Worst Student: " worst_student " scored " min_score

}
