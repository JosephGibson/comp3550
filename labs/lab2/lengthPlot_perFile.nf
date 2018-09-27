#!/usr/bin/env nextflow


/*
* pipeline input parameters
*/

params.inDir = "fastaFiles"


Channel
.fromPath( "${params.inDir}/*.fa" )
.ifEmpty { error "Cannot find any input sequence files matching: *.fa" }
.set { fastaFiles }


/*
* Get sequence lengths
*/
process getLengths{

input:
    file aFile from fastaFiles

output:
    file "${aFile.baseName}_lengths.txt" into lengths

script:
"""
awk -F "\\n" '!/^>/ {print length (\$0) } /^>/ { printf "%s\\t", \$0}' ${aFile} > ${aFile.baseName}_lengths.txt
"""
}


/*
* Use the lengths to create a density plot in R
*/
process plotLength{

input:
    file seqLengths from lengths

output:
    file "${seqLengths.baseName}.pdf" into plot

script:
"""
#!/usr/bin/env Rscript
lengths <- read.table("${seqLengths}", sep = "\\t", header = F)
pdf("${seqLengths.baseName}.pdf")
plot(density(lengths[,2]), xlab = "Sequence length (nts)")
dev.off()
"""
}

//Collect the file so it is created in our working directory
plot
.collectFile(storeDir: ".")

