#! /bin/bash

#for mass in 500 625 750 1000 1250 1500 2000; do
for mass in 500 750 1000 1250 1500 2000; do
  combineCards.py datacard_${mass}_1btag.txt datacard_${mass}_2btag.txt > datacard_${mass}_1+2btag.txt
done
