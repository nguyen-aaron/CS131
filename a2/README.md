# Search and Replace Shell Tool

# What this command does
The `searchandreplace` command is a shell script that searches for a specified string (`old_string`) in all files within a given directory (and its subdirectories) and replaces it with a new string (`new_string`). The command recursively traverses the directory, excluding the script itself, and performs the replacement in each file where the old string is found.

# Why/When this command is useful
This command is useful for automating the process of updating strings in multiple files within a directory. For example, it can be used when refactoring code, updating configuration files, or changing variables or function names across multiple scripts or text files in a project. It’s ideal for bulk string replacement.

# How you can use this command
To use the command, provide three arguments:
1. The directory where you want to perform the search and replace.
2. The string you want to replace (`old_string`).
3. The string you want to replace it with (`new_string`).

# Syntax:
./searchandreplace <directory> <old_string> <new_string>

# Example:
$ ./searchandreplace /path/to/files 'oldtext' 'newtext'
Replaced 3 occurrences in /path/to/files/file1.txt
Replaced 5 occurrences in /path/to/files/subdir/file2.txt
Finished replacing 'oldtext' with 'newtext'
