#!/bin/bash

START="1"
STOP="10"
SIM_TIME="600"
# 1=OLSR; 2=AODV; 3=DSDV; 4=DSR
ROUTING="1 2 3 4"
VEHICLES="50 100 200 300"

PROGRAM_NAME="promet-optimized"

echo Experiment starts...

echo scenario 1
for v in $VEHICLES
do
  for r in $ROUTING
  do
    for (( run=$START; run<=$STOP; run++ ))
    do
      echo 
      echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
      echo x   Run = $run 
      echo x   "./waf --run \"$PROGRAM_NAME --simTime=$SIM_TIME --routingProtocol=$r --scenario=1 --nNodes=$v"
      echo x   "      --startRngRun=$START --currentRngRun=$run --stopRngRun=$STOP --externalRngRunControl=1\""
      echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
      echo "Start time:"
      date
      ./waf --run "$PROGRAM_NAME --scenario=1 --nNodes=$v --simTime=$SIM_TIME --routingProtocol=$r --startRngRun=$START --currentRngRun=$run --stopRngRun=$STOP --externalRngRunControl=1"
      echo "StopTime:"
      date
      echo --------------------------------------------------------------------------
    done
  done
done
