#!/bin/bash -ue
awk -F "\n" '!/^>/ {print length ($0) } /^>/ { printf "%s\t", $0}' 
file1.fa > lengths.txt
