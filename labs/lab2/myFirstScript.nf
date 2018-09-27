#!/usr/bin/env nextflow


/*
* pipeline input parameters
*/

aFile = file("${params.inFile}")

process getColumm{

input: file seq From aFile

output:file "secondCol.txt" into out

script:
"""
cut -f2 aFile > secondCol.txt 
"""

}

out.collectFile(storeDir: ".")