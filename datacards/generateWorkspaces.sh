#! /bin/bash

# Generate the workspaces associated with nominal datacards

ln -s ../workspaces .
ln -s ../workspaces_for_combined .

#for mass in 500 625 750 1000 1250 1500 2000; do
for mass in 500 750 1000 1250 1500 2000; do
  output="datacard_${mass}_1+2btag.txt"
  text2workspace.py -m ${mass} $output -o workspaces_for_combined/workspace_combined_${mass}_1+2btag.root
done
