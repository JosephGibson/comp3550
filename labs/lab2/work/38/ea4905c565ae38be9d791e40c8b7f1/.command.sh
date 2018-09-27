#!/usr/bin/env Rscript
lengths <- read.table("file1_lengths.txt", sep = "\t", header = F)
pdf("file1_lengths.pdf")
plot(density(lengths[,2]), xlab = "Sequence length (nts)")
dev.off()
