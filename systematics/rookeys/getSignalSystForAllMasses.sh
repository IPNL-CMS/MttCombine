#! /bin/bash

for mass in 500 750 1000 1250 1500 2000; do
  if [ -f keyspdf_syst_${mass}/mlfit_${mass}.root ]; then
    syst=`root -l -n -b -q keyspdf_syst_${mass}/mlfit_${mass}.root getSignalSyst.c | grep 'For datacard' | cut -d " " -f 3`
    echo "M = $mass : $syst"
  fi
done
