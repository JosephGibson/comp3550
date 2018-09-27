#!/usr/bin/env Rscript
lengths <- read.table("seqLengths.txt", sep = "\t", header = F)
pdf("lenDist.pdf")
plot(density(lengths[,2]), xlab = "Sequence length (nts)")
dev.off()
