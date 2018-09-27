#!/usr/bin/env Rscript
lengths <- read.table("file2_lengths.txt", sep = "\t", header = F)
pdf("file2_lengths.pdf")
plot(density(lengths[,2]), xlab = "Sequence length (nts)")
dev.off()
