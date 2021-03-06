#!/bin/bash

for mass in 700 #150 200 250 300 350 400 450 500 550 600 650 700 750 800 850
  do
  for width in 2.00 5.00 7.00 #10.00
    do
    echo $mass $width
    
    echo "combine  /afs/cern.ch/work/s/soffi/CMSSW611-Analysis/src/h2gglobe/ChiaraFitLimits/datacardWithAllSyst/HighMass-hgg_8TeV_m${mass}.00_w${width}_COMB_GGH.txt -M Asymptotic -m ${mass} -D data_obs --run=both  -U --noFitAsimov --saveToys -S 1 -n _w${width}"
    combine  /afs/cern.ch/work/s/soffi/CMSSW611-Analysis/src/h2gglobe/ChiaraFitLimits/datacardWithAllSyst/HighMass-hgg_8TeV_m${mass}.00_w${width}_COMB_GGH.txt -M Asymptotic -m ${mass} -D data_obs --run=both  -U --noFitAsimov --saveToys -S 1 -n _w${width}
    
  done #{width}
done #mass


