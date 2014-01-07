#! /bin/bash

for mass in 500 625 750 1000 1250 1500 2000; do
  if [ -f datacard_${mass}_1btag_mu.txt ]; then
    text2workspace.py -m $mass datacard_${mass}_1btag_mu.txt -o workspaces_combined/splitted/workspace_combined_${mass}_1btag_mu.root -v3
  fi

  if [ -f datacard_${mass}_1btag_e.txt ]; then
    text2workspace.py -m $mass datacard_${mass}_1btag_e.txt -o workspaces_combined/splitted/workspace_combined_${mass}_1btag_e.root -v3
  fi

  if [ -f datacard_${mass}_2btag_mu.txt ]; then
    text2workspace.py -m $mass datacard_${mass}_2btag_mu.txt -o workspaces_combined/splitted/workspace_combined_${mass}_2btag_mu.root -v3
  fi

  if [ -f datacard_${mass}_2btag_e.txt ]; then
    text2workspace.py -m $mass datacard_${mass}_2btag_e.txt -o workspaces_combined/splitted/workspace_combined_${mass}_2btag_e.root -v3
  fi
done
