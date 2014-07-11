#! /bin/bash

# Generate the datacards for computing systematics.

cd Systematics

for mass in 500 750 1000 1250 1500 2000; do
  for btag in 1 2; do
    f="../datacard_${mass}_${btag}btag.txt"

    for syst in jecUp jecDown jerUp jerDown puUp puDown btagUp btagDown leptUp leptDown; do
      output="datacard_${mass}_${btag}btag_${syst}.txt"

      sed "s/\$CHANNEL/\$CHANNEL_${syst}/g" $f > $output
    done
  done
  for syst in jecUp jecDown jerUp jerDown puUp puDown btagUp btagDown leptUp leptDown; do
    output="datacard_${mass}_1+2btag_${syst}.txt"

    combineCards.py datacard_${mass}_1btag_${syst}.txt datacard_${mass}_2btag_${syst}.txt > $output
    sed -i -e "5ashapes data_obs ch1_e_1b  workspaces/zprime_\$MASS_workspace.root w:\$PROCESS_e_1b" $output
    sed -i -e "6ashapes data_obs ch1_mu_1b  workspaces/zprime_\$MASS_workspace.root w:\$PROCESS_mu_1b" $output
    sed -i -e "7ashapes data_obs ch2_e_2b  workspaces/zprime_\$MASS_workspace.root w:\$PROCESS_e_2b" $output
    sed -i -e "8ashapes data_obs ch2_mu_2b  workspaces/zprime_\$MASS_workspace.root w:\$PROCESS_mu_2b" $output
    sed -i -e "9ashapes background ch1_e_1b  workspaces/zprime_\$MASS_workspace.root w:\$PROCESS_e_1b" $output
    sed -i -e "10ashapes background ch1_mu_1b  workspaces/zprime_\$MASS_workspace.root w:\$PROCESS_mu_1b" $output
    sed -i -e "11ashapes background ch2_e_2b  workspaces/zprime_\$MASS_workspace.root w:\$PROCESS_e_2b" $output
    sed -i -e "12ashapes background ch2_mu_2b  workspaces/zprime_\$MASS_workspace.root w:\$PROCESS_mu_2b" $output

    sed -i "s/kmax.*/kmax 0/g" $output
    sed -i '27,32d' $output
  done
done
