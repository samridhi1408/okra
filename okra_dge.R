library(DESeq2)  
library(tximport)  
library(ggplot2)  
library(pheatmap)  
library(apeglm) 
countData <- read.csv("/Users/samridhimakkar/Desktop/okra/input_4samples.csv", row.names = 1)
head(countData)
dat <- as.matrix(countData)
head(dat)
condition <- factor(c("Ctrl","Ctrl", "Stress", "Stress"), levels = c("Ctrl", "Stress"))

condition <- relevel(condition, ref = "Ctrl")

colnames(dat) <- c("control1", "control2", "stress1", "stress2")

coldata <- data.frame(row.names = colnames(dat), condition)

dds <- DESeqDataSetFromMatrix(countData = dat,
                              colData = coldata,
                              design = ~ condition)
dds <- dds[rowSums(counts(dds)) > 10, ]
dds <- DESeq(dds)
res <- results(dds)
results_table <- as.data.frame(res)
View(results_table)
write.csv(results_table, "DESeq2_results.csv")
plotMA(res, main = "DESeq2 MA Plot", ylim = c(-5, 5))
ggplot(results_table, aes(x = log2FoldChange, y = -log10(padj))) +
  geom_point(aes(color = padj < 0.05)) +
  labs(title = "Volcano Plot", x = "log2 Fold Change", y = "-log10 Adjusted p-value") +
  theme_minimal()
vsd <- vst(dds, blind = FALSE)  
topgenes <- head(order(res$padj), 20)
pheatmap(assay(vsd)[topgenes, ], cluster_rows = TRUE, cluster_cols = TRUE)
summary(res)

