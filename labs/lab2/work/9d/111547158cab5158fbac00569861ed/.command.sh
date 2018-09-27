#!/bin/bash -ue
awk -F "\n" '!/^>/ {print length ($0) } /^>/ { printf "%s\t", $0}' 
file3.fa > lengths.txt
