#! /bin/bash

for m in 500 750 1000 1250 1500 2000; do
  cd crab_zprime_$m/res
  echo "Extrating tgz files"
  ls *.tgz | xargs -i tar xf {}
  cd outputToy
  hadd -f toys_result_$m.root higgs*.root

  cd ../../../
done
