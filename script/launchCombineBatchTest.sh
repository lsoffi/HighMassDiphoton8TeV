
#!/bin/bash
#append=local

usage(){
    echo "Usage: `basename $0` joblist_file" > /dev/stderr
}

case $# in 
    0)
	echo -n "Error: " > /dev/stderr
	usage
	exit 1
	;;
    *)
	;;
esac

taskName=combineW10_new


fixed=0
noPois=1
onlyB=0
nToy=20
nJobs=1

muGen=0

jobNumb=0
queue=$1
perc=0
sigGen=0
let nJobs_=$nJobs-1
model=$2

mkdir -p log/
mkdir -p log/$taskName
mkdir -p batch/
mkdir -p batch/${taskName}
echo "################ Task ${taskName} ##############"    

#DiJet


     for jobNumb in `seq 0 $nJobs_`
	  do
	  for ((mass=400;mass<401;mass++))#mass in 150 160 170 180 190 200 210 220 230 240 260 270 280 290 300 310 320 330 340 350 360 370 380 390 400 410 420 430 440 450 460 470 480 490 500 510 520 530 540 550 560 570 580 590 600 610 620 630 640 650 660 670 680 690 700 710 720 730 740 750 760 770 780 790 800 810 820 830 840 850 #
#
	    do
	    for width in  10.00 #10.00 7.00 5.00 2.00 0.10
	      do
	      for cat in COMB #channel0 channel1 channel2 channel3 
		do
		
		echo "Processing jobNumb: $jobNumb,  mass: $mass, width: $width cat: $cat" > /dev/stdout    
				
		sample='m'$mass'_w'$width'_'$cat'_j'$jobNumb'_mod'$model
		echo $sample
		jobname=$taskName"_"$sample
		stdout_file=`pwd`/log/$taskName/`basename ${sample}_ .list`-out.log
		echo "combine  /afs/cern.ch/work/s/soffi/CMSSW611-Analysis/src/h2gglobe/ChiaraFitLimits/datacardWithAllSyst/HighMass-hgg_8TeV_m${mass}.00_w${width}_${cat}_${model}.txt -M Asymptotic -m ${mass} -D data_obs --run=both  -U  -S 1 -n _w${width}_${cat}_${model}"
		if [ "$queue" == "local" ]; then  
		 combine  /afs/cern.ch/work/s/soffi/CMSSW611-Analysis/src/h2gglobe/ChiaraFitLimits/datacardWithAllSyst/HighMass-hgg_8TeV_m${mass}.00_w${width}_${cat}_${model}.txt -M Asymptotic -m ${mass} -D data_obs --run=both  -U  -S 1 -n _w${width}_${cat}_${model}
		    exit 0
		else
		    
		    cat <<EOF >  batch/$taskName/${jobname}.sh
#!/bin/sh
cd $PWD
eval \`scramv1 runtime -sh\`
cd \$WORKDIR
mkdir workspaces
cp /afs/cern.ch/work/s/soffi/CMSSW611-Analysis/src/h2gglobe/ChiaraFitLimits/datacardWithAllSyst/HighMass-hgg_8TeV_m${mass}.00_w${width}_${cat}_${model}.txt ./
cp /afs/cern.ch/work/s/soffi/CMSSW611-Analysis/src/h2gglobe/ChiaraFitLimits/workspaces/HighMass-hgg_8TeV_m${mass}.00_w${width}.inputsig_${model}.root ./workspaces/
cp  /afs/cern.ch/work/s/soffi/CMSSW611-Analysis/src/h2gglobe/ChiaraFitLimits/workspaces/HighMass-hgg.inputbkg_m${mass}.00.root ./workspaces/

combine HighMass-hgg_8TeV_m${mass}.00_w${width}_${cat}_${model}.txt -M Asymptotic -m ${mass} -D data_obs --run=both  -U  -S 1 -n _w${width}_${cat}_${model}
mv -v higgsCombine_w${width}_${cat}_${model}.Asymptotic.mH${mass}.root /afs/cern.ch/work/s/soffi/CMSSW611-Analysis/src/h2gglobe/ChiaraFitLimits/${cat}/
EOF
		    echo "bsub -J $jobname -q $queue -o $stdout_file < `pwd`/batch/$taskName/${jobname}.sh"
		 bsub -J $jobname -q $queue -o $stdout_file < `pwd`/batch/$taskName/${jobname}.sh
		fi
	      done
	    done
	 done
    done


#std masses:
#150 200 250 300 350 400 450 500 550 600 650 700 750 800 850
#


#done1
# 
#done2
#


#556 558 560 562 564 566 568 570 572 574 576 578 580 582 584 586 588 590 592 594 596 598 600 602 604 #
