#! /bin/bash

# Split all datacards in different flavors

for mass in 500 625 750 1000 1250 1500 2000; do
  ./splitDatacards.sh datacard_${mass}_1btag.txt
  ./splitDatacards.sh datacard_${mass}_2btag.txt
done;
