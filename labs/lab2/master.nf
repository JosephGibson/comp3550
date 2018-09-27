#!/usr/bin/env nextflow


/*
* pipeline input parameters
*/








/*
* Get sequence lengths
*/
process getLengths{

input:


output:


script:
"""

"""
}



//Collect all the files into a single file
lengths
.collectFile(name: file("seqLengths.txt"))
.set{lengths2}


/*
* Use the lengths to create a density plot in R
*/
process plotLength{

input:


output:


script:
"""
#!/usr/bin/env Rscript
lengths <- read.table("${seqLengths}", sep = "\\t", header = F)
pdf("lenDist.pdf")
plot(density(lengths[,2]), xlab = "Sequence length (nts)")
dev.off()
"""
}

//Collect the file so it is created in our working directory





