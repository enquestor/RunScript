# RunScript
A simple bash script for compiling and executing simple c++ programs at once.

## Install

Download `install.sh` and execute it.
```
sudo bash install.sh
```

You should be able to use `RunScript` using `run` command anywhere now.

## Features

### Compile and Execute
To compile then run a specific file:
```
run [your_file_name].cpp
```
The compiled program would be named `[your_file_name]` instead of `[a.out]` from `gcc` or `g++`.

If no file is specified, the last-edited file would be used.

### Input
The script would use `[your_file_name].in` as stdin if the file exists.
Otherwise, you'd be able to manually input.

### Output
To output to a file:
```
run [your_file_name].cpp -o
```
The output would be saved to `[your_file_name].out`.
