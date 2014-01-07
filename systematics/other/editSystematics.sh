#! /bin/bash

for mass in 500 625 750 1000 1250 1500 2000; do

    echo "M = ${mass}"
    nominal="workspaces_for_combined/workspace_combined_${mass}_1+2btag.root"
    nominal_xsection=`combine -M MaxLikelihoodFit --rMin -10 -m ${mass} -S 0 $nominal 2>&1 | grep "Best fit r" | cut -d' ' -f4`
    nominal_xsection=${nominal_xsection#-}

    syst_number=0
    for syst in jecUp jecDown; do
      syst="workspaces_for_combined/Systematics/workspace_combined_${mass}_1+2btag_${syst}.root"

      syst_xsection=`combine -M MaxLikelihoodFit --rMin -10 -m ${mass} -S 0 $syst 2>&1 | grep "Best fit r" | cut -d' ' -f4`
      syst_xsection=${syst_xsection#-}
      tmp=`echo "$nominal_xsection - $syst_xsection" | bc`
      tmp=${tmp#-}

      syst_number=`echo "$syst_number + $tmp" | bc`
    done
    syst_number=`echo "scale=5; $syst_number / 2." | bc`
    echo "jec  lnN    `echo \"$syst_number + 1\" | bc`    -             `echo \"$syst_number + 1\" | bc`    -"
    sed -i "18s/.*/jec  lnN    `echo \"$syst_number + 1\" | bc`    -             `echo \"$syst_number + 1\" | bc`    -/" ../datacards/datacard_${mass}_1btag.txt
    sed -i "18s/.*/jec  lnN    `echo \"$syst_number + 1\" | bc`    -             `echo \"$syst_number + 1\" | bc`    -/" ../datacards/datacard_${mass}_2btag.txt


    syst_number=0
    for syst in jerUp jerDown; do
      syst="workspaces_for_combined/Systematics/workspace_combined_${mass}_1+2btag_${syst}.root"

      syst_xsection=`combine -M MaxLikelihoodFit --rMin -10 -m ${mass} -S 0 $syst 2>&1 | grep "Best fit r" | cut -d' ' -f4`
      syst_xsection=${syst_xsection#-}
      tmp=`echo "$nominal_xsection - $syst_xsection" | bc`
      tmp=${tmp#-}

      syst_number=`echo "$syst_number + $tmp" | bc`
    done
    syst_number=`echo "scale=5; $syst_number / 2." | bc`
    echo "jer  lnN    `echo \"$syst_number + 1\" | bc`    -             `echo \"$syst_number + 1\" | bc`    -"
    sed -i "19s/.*/jer  lnN    `echo \"$syst_number + 1\" | bc`    -             `echo \"$syst_number + 1\" | bc`    -/" ../datacards/datacard_${mass}_1btag.txt
    sed -i "19s/.*/jer  lnN    `echo \"$syst_number + 1\" | bc`    -             `echo \"$syst_number + 1\" | bc`    -/" ../datacards/datacard_${mass}_2btag.txt

    syst_number=0
    for syst in puUp puDown; do
      syst="workspaces_for_combined/Systematics/workspace_combined_${mass}_1+2btag_${syst}.root"

      syst_xsection=`combine -M MaxLikelihoodFit --rMin -10 -m ${mass} -S 0 $syst 2>&1 | grep "Best fit r" | cut -d' ' -f4`
      syst_xsection=${syst_xsection#-}
      tmp=`echo "$nominal_xsection - $syst_xsection" | bc`
      tmp=${tmp#-}

      syst_number=`echo "$syst_number + $tmp" | bc`
    done
    syst_number=`echo "scale=5; $syst_number / 2." | bc`
    echo "pu  lnN    `echo \"$syst_number + 1\" | bc`    -             `echo \"$syst_number + 1\" | bc`    -"
    sed -i "20s/.*/pu  lnN    `echo \"$syst_number + 1\" | bc`    -             `echo \"$syst_number + 1\" | bc`    -/" ../datacards/datacard_${mass}_1btag.txt
    sed -i "20s/.*/pu  lnN    `echo \"$syst_number + 1\" | bc`    -             `echo \"$syst_number + 1\" | bc`    -/" ../datacards/datacard_${mass}_2btag.txt

    #syst_number=0
    #for syst in pdfUp pdfDown; do
      #syst="workspaces_for_combined/Systematics/workspace_combined_${mass}_1+2btag_${syst}.root"

      #syst_xsection=`combine -M MaxLikelihoodFit --rMin -10 -m ${mass} -S 0 $syst 2>&1 | grep "Best fit r" | cut -d' ' -f4`
      #syst_xsection=${syst_xsection#-}
      #tmp=`echo "$nominal_xsection - $syst_xsection" | bc`
      #tmp=${tmp#-}

      #syst_number=`echo "$syst_number + $tmp" | bc`
    #done
    #syst_number=`echo "scale=5; $syst_number / 2." | bc`
    #echo "pdf  lnN    `echo \"$syst_number + 1\" | bc`    -             `echo \"$syst_number + 1\" | bc`    -"
    #sed -i "21s/.*/pdf  lnN    `echo \"$syst_number + 1\" | bc`    -             `echo \"$syst_number + 1\" | bc`    -/" ../datacards/datacard_${mass}_1btag.txt
    #sed -i "21s/.*/pdf  lnN    `echo \"$syst_number + 1\" | bc`    -             `echo \"$syst_number + 1\" | bc`    -/" ../datacards/datacard_${mass}_2btag.txt
done
