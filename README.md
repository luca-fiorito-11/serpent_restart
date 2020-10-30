# This is a script to handle geometry/material/model variations in a Serpent input file during burnup

Usage of [serpent_restart.sh](serpent_restart.sh):
```bash
bash serpent_restart.sh [N]
```
where `N` is the step number where you want the file to restart (default is `1`).


This script reads input changes from a csv file such as [data.csv](data.csv).

The header of the csv file contains the placeholders that you must add in the Serpent input file.
At each step, this bash script takes care of replacing the placeholder with the corresponding value. 


