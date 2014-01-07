MttCombine
==========

Utilities and scripts in order to use Higgs Combine tools

## Area setup

```bash
export SCRAM_ARCH=slc5_amd64_gcc472
cmsrel CMSSW_6_1_1
cmsenv
git clone https://github.com/cms-analysis/HiggsAnalysis-CombinedLimit.git HiggsAnalysis/CombinedLimit

cd HiggsAnalysis/CombinedLimit
git checkout V03-05-00
cd -

git clone https://github.com/IPNL-CMS/MttCombine.git

scram b -j8
```
