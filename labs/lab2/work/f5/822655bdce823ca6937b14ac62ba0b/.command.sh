#!/bin/bash -ue
awk -F "\n" '!/^>/ {print length ($0) } /^>/ { printf "%s\t", $0}' file2.fa > file2_lengths.txt
