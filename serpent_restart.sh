BMARK=rebus      # write here the name of your serpent input file
INPUT=data.csv   # this is the database of model variations
OLDIFS=$IFS
START_AT=${1:-1} # at what step do you want to start? default is from the first
IFS=','
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
{
  read
  while read CYCLE STEP TF FEXT TC TW WEXT DW THLOW THHIGH PPM H2O POWDENS DEPMODE DEPVAL IDX
  do
    [[ ${IDX} -lt ${START_AT} ]] && continue
    file=${BMARK}_cycle_${CYCLE}_step_${STEP}.i
    PREVIOUS=$((IDX - 1))
    sed -e "s/CYCLE/$CYCLE/g" \
        -e "s/STEP/$STEP/g" \
        -e "s/TF/$TF/g" \
        -e "s/FEXT/$FEXT/g" \
        -e "s/TC/$TC/g" \
        -e "s/TW/$TW/g" \
        -e "s/WEXT/$WEXT/g" \
        -e "s/DW/$DW/g" \
        -e "s/THLOW/$THLOW/g" \
        -e "s/THHIGH/$THHIGH/g" \
        -e "s/PPM/$PPM/g" \
        -e "s/H2O/$H2O/g" \
        -e "s/POWDENS/$POWDENS/g" \
        -e "s/DEPMODE/$DEPMODE/g" \
        -e "s/DEPVAL/$DEPVAL/g" \
        -e "s/IDX/$IDX/g" \
        -e "s/PREVIOUS/$PREVIOUS/g" <${BMARK}.i >$file
    [[ "$IDX" != "1" ]] && sed -i "s/% set rfr/set rfr/" $file
    # RUN SERPENT
    /home/lfiorito/SERPENT2/sss2 -omp 72 $file  # change the serpent executable and the running options
    wait
  done
} < $INPUT
