#!/bin/sh

exec_vth () {
local  leff=$1
local  tox=$2
local  nsubc=$3
local  nsubp=$4
local  xld=$5
local  muesr1=$6
local  muecb0=$7

local filename=leff${leff}_tox${tox}_nsubc${nsubc}_xld${xld}_muesr1${muesr1}_muecb0${muecb0}

#echo ${filename}
#echo "./vth-exec.scm ${filename}.dat ${leff}"
./vth-exec.scm ${filename}.dat ${leff} | grep conc | sed -e 's/                               =>//'

}

#for leff in "10000e-9" "100e-9"
# for leff in "80e-9" "60e-9"
for leff in "50e-9" "40e-9"
do
    tox="1.0"; nsubc="1.0"; nsubp="1.0"; xld="1.0"; muesr1="1.0"; muecb0="1.0"
    for tox in "0.9" "0.95" "1.0" "1.05" "1.1"
    do
        echo -n $tox
        echo -n "    "
        exec_vth ${leff} ${tox} ${nsubc} ${nsubp} ${xld} ${muesr1} ${muecb0}
    done
    echo
    tox="1.0"; nsubc="1.0"; nsubp="1.0"; xld="1.0"; muesr1="1.0"; muecb0="1.0"
    for nsubc in "0.9" "0.95" "1.0" "1.05" "1.1"
    do
        echo -n $nsubc
        echo -n "     "
        exec_vth ${leff} ${tox} ${nsubc} ${nsubp} ${xld} ${muesr1} ${muecb0}
    done
    echo
    tox="1.0"; nsubc="1.0"; nsubp="1.0"; xld="1.0"; muesr1="1.0"; muecb0="1.0"
    for nsubp in "0.9" "0.95" "1.0" "1.05" "1.1"
    do
        echo -n $nsubp
        echo -n "     "        
        exec_vth ${leff} ${tox} ${nsubc} ${nsubp} ${xld} ${muesr1} ${muecb0} 
    done
    echo
    tox="1.0"; nsubc="1.0"; nsubp="1.0"; xld="1.0"; muesr1="1.0"; muecb0="1.0"
    for xld in "0.9" "0.95" "1.0" "1.05" "1.1"
    do
        echo -n $xld
        echo -n "     "        
        exec_vth ${leff} ${tox} ${nsubc} ${nsubp} ${xld} ${muesr1} ${muecb0}
    done
    echo    
    tox="1.0"; nsubc="1.0"; nsubp="1.0"; xld="1.0"; muesr1="1.0"; muecb0="1.0"
    for muesr1 in "0.9" "0.95" "1.0" "1.05" "1.1"
    do
        echo -n $muesr1
        echo -n "     "        
        exec_vth ${leff} ${tox} ${nsubc} ${nsubp} ${xld} ${muesr1} ${muecb0}
    done    
    echo
    tox="1.0"; nsubc="1.0"; nsubp="1.0"; xld="1.0"; muesr1="1.0"; muecb0="1.0"
    for muecb0 in "0.9" "0.95" "1.0" "1.05" "1.1"
    do
        echo -n $muecb0
        echo -n "     "        
        exec_vth ${leff} ${tox} ${nsubc} ${nsubp} ${xld} ${muesr1} ${muecb0}
    done
    echo
    echo
done


