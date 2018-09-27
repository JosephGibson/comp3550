#!/usr/bin/env Rscript
lengths <- read.table("file3_lengths.txt", sep = "\t", header = F)
pdf("file3_lengths.pdf")
plot(density(lengths[,2]), xlab = "Sequence length (nts)")
dev.off()
