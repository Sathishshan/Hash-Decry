#!/bin/bash

# Colour
g="\033[32m"
r="\033[31m"
b="\033[34m"
cr="\033[36m"
lrbg="\033[101m"
bbg="\033[44m"
n="\033[0m"

# Banner
echo -e "${cr}"
cat << "EOF"
              _      _          _ _
             (_)    | |        (_) |
   __ _ _   _ _  ___| | __  ___ _| |_   _____ _ __
  / _` | | | | |/ __| |/ / / __| | \ \ / / _ \ '__|
 | (_| | |_| | | (__|   <  \__ \ | |\ V /  __/ |
  \__, |\__,_|_|\___|_|\_\ |___/_|_| \_/ \___|_|
     | |               ______
     |_|              |______|
EOF
echo -e "${n}"
echo "[+] Algorithms"
echo "[+]" "MD5 |" "SHA1 |" "SHA-256 |" "SHA-384 |" "SHA-512"
echo
# Hash Check & Ensuring the userinput
while [ -z $hash ]; do
echo -n  "Enter the hash value: "
read hash
done
count=$(echo -n $hash | wc -m)

# Working Area
if [ "$count" -eq 32 ]; then
        echo -e "It's a ${b}MD5${n} hash"
        hashfor=$(curl -s "http://hashtoolkit.com/reverse-hash/?hash=${hash}" | sed -n 219p | cut -d '>' -f 4 | cut -d "<" -f 1)
        if [ -z $hashfor ]; then
                echo -e "${r}But, no hash crack found!${n}"
        else
                echo -e "${g}Hash for:${n} $hashfor"
                exit
        fi
elif [ "$count" -eq 40 ]; then
        echo -e "It's a ${b}SHA1${n} hash"
        hashfor=$(curl -s "http://hashtoolkit.com/reverse-hash/?hash=${hash}" | sed -n 219p | cut -d '>' -f 4 | cut -d "<" -f 1)
        if [ -z $hashfor ]; then
                echo -e "${r}But, no hash crack found!${n}"
        else
                echo -e "${g}Hash for:${n} $hashfor"
                exit
        fi
elif [ "$count" -eq 64 ]; then
        echo -e "It's a ${b}SHA-256${n} hash"
        hashfor=$(curl -s "http://hashtoolkit.com/reverse-hash/?hash=${hash}" | sed -n 219p | cut -d '>' -f 4 | cut -d "<" -f 1)
        if [ -z $hashfor ]; then
                echo -e "${r}But, no hash crack found!${n}"
        else
                echo -e "${g}Hash for:${n} $hashfor"
                exit
        fi
elif [ "$count" -eq 96 ]; then
        echo -e "It's a ${b}SHA-384${n} hash"
        hashfor=$(curl -s "http://hashtoolkit.com/reverse-hash/?hash=${hash}" | sed -n 219p | cut -d '>' -f 4 | cut -d "<" -f 1)
        if [ -z $hashfor ]; then
                echo -e "${r}But, no hash crack found!${n}"
        else
                echo -e "${g}Hash for:${n} $hashfor"
                exit
        fi
elif [ "$count" -eq 128 ]; then
        echo -e "It's a ${b}SHA-512${n} hash"
        hashfor=$(curl -s "http://hashtoolkit.com/reverse-hash/?hash=${hash}" | sed -n 219p | cut -d '>' -f 4 | cut -d "<" -f 1)
        if [ -z $hashfor ]; then
                echo -e "${r}But, no hash crack found!${n}"
        else
                echo -e "${g}Hash for:${n} $hashfor"
                exit
        fi
else
        echo -e "${lrbg}Hash Value Miss Match${n} || ${bbg}Unknown Algorithm ${n}"
        exit
fi
