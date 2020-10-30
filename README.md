# This is a script to handle geometry/material/model variations in a Serpent input file during burnup

Usage:
```bash
bash ./serpent_restart [N]
```
where `N` is the step number where you want the file to restart (default is `1`).


This script reads input changes from a csv file such as data.csv.

The header od the files contains the placeholders that you must add in the Serpent input file.
At each step, this bash script takes care of replacing the placeholder with the corresponding value. 


