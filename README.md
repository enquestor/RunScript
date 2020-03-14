# RunScript
A simple bash script for compiling and executing simple c++ programs at once.

## Install

Download the script using `wget`.
```
wget -O ~/run.sh https://raw.githubusercontent.com/Allen-Hu/RunScript/master/run.sh
```

Give permissions.
```
sudo chmod a+x ~/run.sh
```

Throw it into your `/sbin`.
```
sudo mv ~/run.sh /sbin/run
```

You should be able to use `RunScript` using `run` command anywhere now.

## Features

### Compile and Execute
To compile then run a specific file:
```
run [your_file_name].cpp
```
The compiled program would be named `[your_file_name]` instead of `[a.out]` from `gcc` or `g++`

### Input
The script would use `[your_file_name].in` as stdin if the file exists.
Otherwise, you'd be able to manually input.

### Output
To output to a file:
```
run [your_file_name].cpp -o
```
The output would be saved to `[your_file_name].out`.
