#! /bin/bash

for m in 500 750 1000 1250 1500 2000; do
  cp datacard_1btag.template datacard_${m}_1btag.txt
  cp datacard_2btag.template datacard_${m}_2btag.txt
done
