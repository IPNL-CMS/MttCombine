#! /bin/bash

for mass in 500 750 1000 1250 1500 2000; do
  syst=`./computeKeysPdfSyst $mass`
  echo "M = $mass : $syst"
done

