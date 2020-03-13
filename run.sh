#!/bin/sh

readonly default_filename='a.cc'
readonly program_filename_extension=''
readonly compiler='g++' # gcc or g++
readonly cpp_version='c++17'

source_filename="$1"
if [ "$2" = '-o' ] ; then
	output_to_file=1
fi

# Find File
if [ -z "$source_filename" ] ; then
	source_filename="$default_filename"
fi
if [ ! -f "$source_filename" ] ; then
	echo [run] File "$source_filename" does not exist.
	exit
fi
clean_filename=$(echo "$source_filename" | rev | sed -e "s/^.*\.//1" | rev)

# Compile
echo [run] Compiling "$source_filename" ...
"$compiler" -std="$cpp_version" "$source_filename"
compilation_result="$?"

if [ "$compilation_result" != 0 ] ; then
	echo [run] Compilation Error.
	exit
fi
mv a.out "$clean_filename$program_filename_extension"

# Execute
echo [run] Executing ...

if [ -f "$clean_filename".in ] ; then
	if [ "$output_to_file" = 1 ] ; then 
		./"$clean_filename$program_filename_extension" < "$clean_filename".in > "$clean_filename".out
	else
		./"$clean_filename$program_filename_extension" < "$clean_filename".in
	fi
else
	if [ "$output_to_file" = 1 ] ; then
		./"$clean_filename$program_filename_extension" > "$clean_filename".out
	else
		./"$clean_filename$program_filename_extension"
	fi
fi
