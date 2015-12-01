#!/bin/bash

for ((mass=200;mass<=200;mass++)) #200 250 300 350 400 450 500 550 600 650 700 750 800 850 320 160 170 180 190 210 220 230 240 260 270 280 290 310 330 340 360 370 380 390 410 420 430 440 460 470 480 490 510 520 530 540 560 570 580 590 610 620 630 640 660 670 680 690 710 720 730 740 760 770 780 790 810 820 830 840
  do
  for width in 10.00 #5.00 #10.00 #5.00 #2.00 5.00 7.00 0.10
    do
    for cat in  COMB # channel2 channel3
      do
      echo $mass $width
    
 #   echo "combine  /afs/cern.ch/work/s/soffi/CMSSW611-Analysis/src/h2gglobe/ChiaraFitLimits/datacardWithAllSyst/HighMass-hgg_8TeV_m${mass}.00_w${width}_COMBWSyst_GGH.txt -M Asymptotic -m ${mass} -D data_obs --run=both  -U --noFitAsimov --saveToys -S 0 -n _w${width}"
   echo mass 
      combine /afs/cern.ch/work/s/soffi/CMSSW611-Analysis/src/h2gglobe/ChiaraFitLimits/datacardWithAllSyst/HighMass-hgg_8TeV_m${mass}.00_w${width}_${cat}_BwSyst.txt -M Asymptotic -m ${mass} -D data_obs --run=both  -U  -S 1 -n _w${width}_${cat}_BwSyst --verbose 9 --noFitAsimov
#> ~/www/combine_M${mass}.log
    
    done #{width}
  done #mass
done #cat


