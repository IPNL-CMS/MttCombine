MttCombine
==========

Utilities and scripts in order to use Higgs Combine tools

## Area setup

```bash
export SCRAM_ARCH=slc5_amd64_gcc472
cmsrel CMSSW_6_1_1
cd CMSSW_6_1_1/src
cmsenv
git clone https://github.com/cms-analysis/HiggsAnalysis-CombinedLimit.git HiggsAnalysis/CombinedLimit

cd HiggsAnalysis/CombinedLimit
git checkout V03-05-00
cd -

git clone https://github.com/IPNL-CMS/MttCombine.git

scram b -j8
```

## How-to

This How-To suppose you have already performed the first part of the analysis using MttTools.

### Step 0 - copy workspaces

You need to copy the workspaces created by *fitMtt* inside the *workspaces* folder. You must have one workspace per signal point.

### Step 1 - create datacards

Go to the folder *datacards*. The first thing to do is to create empty datacards, using the script *generateEmptyDatacards.sh*. Once this is done, use the output of *fitMtt* to edit the datacards to had the correct rates and number of selected events.

For the moment, the systematics uncertainties are wrong: correct values are computed after. Right now, just execute *generateSystematicsDatacards.sh* to generate the necessary datacards for systematics computation, and then *generateSystematicsWorkspaces.sh* to convert those datacards into workspaces readable by *combined* (those workspaces will be located in *workspaces_for_combined/Systematics/*).

### Step 2.1 - compute RooKeys systematics

Go to the folder *systematics/rookeys*. You need to copy all the workspaces generated by *MttTools* inside a folder named *workspaces* (create it if it does not exists). Then, you just need to execute *computeKeysPdfSyst.sh* in order to compute the systematic uncertainty related to the RooKeys.

In order to have the values of the systematic uncertainty, just execute *getSignalSystForAllMasses.sh*.

Finally, you just need to execute *editSignalSystForAllMasses.sh*. This script will edit the datacards generated at step 1 in order to set correct signal uncertainties.

#### Step 2.2 - compute other systematics

This time, got to the folder *systematics/other*. Just execute *editSystematics.sh* to compute the systematic errors and automatically edit the datacards. Alternatively, you can run *computeSystematics.sh* to just compute the errors (ie, not editing the datacards)
