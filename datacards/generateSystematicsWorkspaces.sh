#! /bin/bash

# Generate the workspaces associated with systematics datacards

cd Systematics
ln -s ../../workspaces .
ln -s ../../workspaces_for_combined .

mkdir workspaces_for_combined/Systematics

#for mass in 500 625 750 1000 1250 1500 2000; do
for mass in 500 750 1000 1250 1500 2000; do
  for syst in jecUp jecDown jerUp jerDown puUp puDown; do
    output="datacard_${mass}_1+2btag_${syst}.txt"
    text2workspace.py -m ${mass} $output -o workspaces_for_combined/Systematics/workspace_combined_${mass}_1+2btag_${syst}.root
  done
done
