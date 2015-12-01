#!/bin/bash
model=$1
for cat in COMB #channel0 channel1 channel2 channel3 #COMB
  do
  for width in  0.10 #10.00 #5.00 7.00 10.00 #
    do   
    echo "python limitPlotter_livia.py -M Asymptotic  -v -p /afs/cern.ch/work/s/soffi/CMSSW611-Analysis/src/h2gglobe/ChiaraFitLimits/${cat} -c ${cat} -w _w${width}${model} -t _w${width}${model}"
    python limitPlotter_livia.py -M Asymptotic -v -p /afs/cern.ch/work/s/soffi/CMSSW611-Analysis/src/h2gglobe/ChiaraFitLimits/${cat} -c ${cat}_${model} -w _w${width} -t _w${width}_${model}

done
done

