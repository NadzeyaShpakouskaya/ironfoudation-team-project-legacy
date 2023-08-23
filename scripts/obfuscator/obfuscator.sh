#!/bin/bash

# Check if the number of command-line arguments is 0
if [ $# -eq 0 ]; then
    echo "Please provide a string to obfuscate as an argument."
    exit 1
fi

# Check if the salt file exists
if [ ! -f "./salt" ]; then
    echo "Salt file 'salt' not found. Please create it."
    exit 1
fi

# Read the salt from the salt file
salt=$(< ./salt)

# Obfuscate function
obfuscate() {
    local string="$1"
    local salt="$2"

    if [ -z "$string" ]; then
        echo ""
        return
    fi

    local -a stringAsBytes
    local -a cipher

    # Convert string characters to ASCII values
    for (( i = 0; i < ${#string}; i++ )); do
        stringAsBytes[$i]=$(printf "%d" "'${string:$i:1}")
    done

    if [ -z "$salt" ]; then
        # Print ASCII values if salt is empty
        printf "%s " "${stringAsBytes[@]}"
        return
    fi

    # Convert salt characters to ASCII values
    for (( i = 0; i < ${#salt}; i++ )); do
        cipher[$i]=$(printf "%d" "'${salt:$i:1}")
    done
    cipherLength=${#cipher[@]}

    # XOR obfuscation
    for (( i = 0; i < ${#stringAsBytes[@]}; i++ )); do
        encrypted=$(( ${stringAsBytes[$i]} ^ ${cipher[$i % cipherLength]} ))
        echo -n "$encrypted "
    done
}

# Call the obfuscate function and store the result
encryptedResult=$(obfuscate "$1" "$salt")

# Write the encrypted result to the specified path
echo "$encryptedResult" > "./api-key"
