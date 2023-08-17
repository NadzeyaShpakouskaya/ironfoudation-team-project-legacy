#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Please provide a string to obfuscate as an argument."
    exit 1
fi

if [ ! -f "./salt" ]; then
    echo "Salt file 'salt' not found. Please create it."
    exit 1
fi

salt=$(< ./salt)

obfuscate() {
    local string="$1"
    local salt="$2"

    if [ -z "$string" ]; then
        echo ""
        return
    fi

    local -a stringAsBytes
    local -a cipher

    for (( i = 0; i < ${#string}; i++ )); do
        stringAsBytes[$i]=$(printf "%d" "'${string:$i:1}")
    done

    if [ -z "$salt" ]; then
        for byte in "${stringAsBytes[@]}"; do
            echo -n "$byte "
        done
        return
    fi

    for (( i = 0; i < ${#salt}; i++ )); do
        cipher[$i]=$(printf "%d" "'${salt:$i:1}")
    done
    cipherLength=${#cipher[@]}

    for (( i = 0; i < ${#stringAsBytes[@]}; i++ )); do
        encrypted=$(( ${stringAsBytes[$i]} ^ ${cipher[$i % cipherLength]} ))
        echo -n "$encrypted "
    done
}

encryptedResult=$(obfuscate "$1" "$salt")
echo "$encryptedResult"
