#! /bin/bash

# Create symbolic link to combine executable

ln -s `which combine` .
ln -s ../workspaces_for_combined .

for m in 500 625 750 1000 1250 1500 2000; do
  sed "s/%mass%/$m/g" crab.template > crab_zprime_${m}.cfg
  sed "s/%mass%/$m/g" combine_crab.sh.template > combine_crab_${m}.sh
done
