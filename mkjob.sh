#!/bin/sh

exec_hsp () {
local  leff=$1
local  tox=$2
local  nsubc=$3
local  nsubp=$4
local  xld=$5
local  muesr1=$6
local  muecb0=$7

local filename=leff${leff}_tox${tox}_nsubc${nsubc}_xld${xld}_muesr1${muesr1}_muecb0${muecb0}

cat <<EOF >  ${filename}.hsp
Simulation Input File
.options ingold=2 numdgt=10
.hdl './xsim2.va'
.model nfet hisim2_va TYPE=1
+ TOX = `echo     "scale=2; 3 *     ${tox}"    | bc`E-09
+ XLD = `echo     "scale=2; 5 *     ${xld}"    | bc`E-09
+ NSUBC = `echo   "scale=2; 4.000 * ${nsubc}"  | bc`E+17
+ NSUBP = `echo   "scale=2; 2.000 * ${nsubp}"  | bc`E+18
+ MUECB0 = `echo  "scale=2; 40.00 * ${muecb0}" | bc`
+ MUESR1 = `echo  "scale=2; 7.000 * ${muesr1}" | bc`E+14
+ TEMP = 25

xCKT D G S E nfet
Rd  DR D  1m
Vd  DR 0  0.05
Vg  G  0  0.0
Vs  SR 0  0.0
Rs  SR S  1m
Ve  E  0  0.0

.DC Vg -1.25 1.25 0.05
.PRINT DC par('-I(Vd)')
.END
EOF

hspice ${filename}.hsp >& ${filename}.log
sleep 1
echo ${filename}
./get-grap.scm ${filename}.log

}

#for leff in "10000e-9" "100e-9"
# for leff in "80e-9" "60e-9"
for leff in "50e-9" "40e-9"
do
    tox="1.0"; nsubc="1.0"; nsubp="1.0"; xld="1.0"; muesr1="1.0"; muecb0="1.0"
    for tox in "0.9" "0.95" "1.0" "1.05" "1.1"
    do
        exec_hsp ${leff} ${tox} ${nsubc} ${nsubp} ${xld} ${muesr1} ${muecb0} &
    done
    wait
        
    tox="1.0"; nsubc="1.0"; nsubp="1.0"; xld="1.0"; muesr1="1.0"; muecb0="1.0"
    for nsubc in "0.9" "0.95" "1.0" "1.05" "1.1"
    do
        exec_hsp ${leff} ${tox} ${nsubc} ${nsubp} ${xld} ${muesr1} ${muecb0} &        
    done
    wait
    
    tox="1.0"; nsubc="1.0"; nsubp="1.0"; xld="1.0"; muesr1="1.0"; muecb0="1.0"
    for nsubp in "0.9" "0.95" "1.0" "1.05" "1.1"
    do
        exec_hsp ${leff} ${tox} ${nsubc} ${nsubp} ${xld} ${muesr1} ${muecb0} &
    done
    wait
    tox="1.0"; nsubc="1.0"; nsubp="1.0"; xld="1.0"; muesr1="1.0"; muecb0="1.0"
    for xld in "0.9" "0.95" "1.0" "1.05" "1.1"
    do
        exec_hsp ${leff} ${tox} ${nsubc} ${nsubp} ${xld} ${muesr1} ${muecb0} &
    done
    wait
    
    tox="1.0"; nsubc="1.0"; nsubp="1.0"; xld="1.0"; muesr1="1.0"; muecb0="1.0"
    for muesr1 in "0.9" "0.95" "1.0" "1.05" "1.1"
    do
        exec_hsp ${leff} ${tox} ${nsubc} ${nsubp} ${xld} ${muesr1} ${muecb0} &
    done    
    wait
    tox="1.0"; nsubc="1.0"; nsubp="1.0"; xld="1.0"; muesr1="1.0"; muecb0="1.0"
    for muecb0 in "0.9" "0.95" "1.0" "1.05" "1.1"
    do
        exec_hsp ${leff} ${tox} ${nsubc} ${nsubp} ${xld} ${muesr1} ${muecb0} &
    done
    wait
done


