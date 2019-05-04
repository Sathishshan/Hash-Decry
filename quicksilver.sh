#!/bin/bash

# Argument Check

if [ $# -ne 1 ]; then
        echo "Need one hash crack it."
        echo "USAGE:
        $0 hash_value"
        exit
fi

# Hash Check
hash=$1
count=$(echo -n $hash | wc -m)

# Working Area
if [ "$count" -eq 32 ]; then
        echo "its a MD5 hash"
        hashfor=$(curl -s "http://hashtoolkit.com/reverse-hash/?hash=${hash}" | sed -n 219p | cut -d '>' -f 4 | cut -d "<" -f 1)
        if [ -z $hashfor ]; then
                echo "But, no hash crack found!"
        else
                echo "Hash for: $hashfor"
                exit
        fi
elif [ "$count" -eq 40 ]; then
        echo "its a SHA1 hash"
        hashfor=$(curl -s "http://hashtoolkit.com/reverse-hash/?hash=${hash}" | sed -n 219p | cut -d '>' -f 4 | cut -d "<" -f 1)
        if [ -z $hashfor ]; then
                echo "But, no hash crack found!"
        else
                echo "Hash for: $hashfor"
                exit
        fi
elif [ "$count" -eq 64 ]; then
        echo "its a SHA-256 hash"
        hashfor=$(curl -s "http://hashtoolkit.com/reverse-hash/?hash=${hash}" | sed -n 219p | cut -d '>' -f 4 | cut -d "<" -f 1)
        if [ -z $hashfor ]; then
                echo "But, no hash crack found!"
        else
                echo "Hash for: $hashfor"
                exit
        fi
elif [ "$count" -eq 96 ]; then
        echo "its a SHA-384 hash"
        hashfor=$(curl -s "http://hashtoolkit.com/reverse-hash/?hash=${hash}" | sed -n 219p | cut -d '>' -f 4 | cut -d "<" -f 1)
        if [ -z $hashfor ]; then
                echo "But, no hash crack found!"
        else
                echo "Hash for: $hashfor"
                exit
        fi
elif [ "$count" -eq 128 ]; then
        echo "its a SHA-512 hash"
        hashfor=$(curl -s "http://hashtoolkit.com/reverse-hash/?hash=${hash}" | sed -n 219p | cut -d '>' -f 4 | cut -d "<" -f 1)
        if [ -z $hashfor ]; then
                echo "But, no hash crack found!"
        else
                echo "Hash for: $hashfor"
                exit
        fi
else
        echo "Hash Value Miss Match"
        exit
fi
