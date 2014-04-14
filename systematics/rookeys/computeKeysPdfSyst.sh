#! /bin/bash

echo "Usage: ./computeKeysPdfSyst [mass]"

mass=$1
datacard="../../../datacards/datacard_${mass}_1+2btag.txt"

output="keyspdf_syst_${mass}"
mkdir $output

cd $output

ln -s "../workspaces" .

for i in {0..149}; do
  datacard_temp="/scratch/datacard_${mass}_1+2btag_${i}.txt"

  sed -e "s/_workspace\.root/_workspace_${i}\.root/" -e "s/zprime/Zprime/g" $datacard > $datacard_temp

  echo "Run combine for toy ${i}..."
  combine -M MaxLikelihoodFit --rMin -10 -S 0 -m $mass $datacard_temp > /dev/null 2>&1
  #combine -M MaxLikelihoodFit --rMin -10 -S 0 -m $mass $datacard_temp

  mv mlfit.root "mlfit_${mass}_${i}.root"

  rm $datacard_temp
  rm roostats-*
done;
