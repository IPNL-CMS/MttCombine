#! /bin/bash

#for mass in 500 625 750 1000 1250 1500 2000; do
for mass in 500 750 1000 1250 1500 2000; do
  if [ -f keyspdf_syst_${mass}/mlfit_${mass}.root ]; then
    syst=`root -l -n -b -q keyspdf_syst_${mass}/mlfit_${mass}.root getSignalSyst.c | grep 'For datacard' | cut -d " " -f 3`
    sed -i "17s/.*/sig  lnN    $syst    -             $syst    -/" ../../datacards/datacard_${mass}_1btag.txt
    sed -i "17s/.*/sig  lnN    $syst    -             $syst    -/" ../../datacards/datacard_${mass}_2btag.txt
  fi
done
