# RNA-Seq Analysis of Okra Plants Under Abiotic Stress

This repository contains files and scripts related to RNA-Seq data analysis conducted to study the effects of abiotic stress on okra plants. The project involves preprocessing RNA-Seq data, differential gene expression (DGE) analysis, and visualization of results using various bioinformatics tools and statistical techniques.

## Repository Contents

### **Data Files**
- **`DESeq2_results.csv`**: Results of differential gene expression analysis generated using the DESeq2 package. Includes log2 fold changes, p-values, and adjusted p-values for all genes.
- **`upregulated.csv`**: List of genes significantly upregulated under abiotic stress.
- **`downregulated.csv`**: List of genes significantly downregulated under abiotic stress.

### **Scripts**
- **`rnaseq.txt`**: Shell script for RNA-Seq preprocessing and alignment using tools such as Trimmomatic, Trinity, SeqKit, and Kallisto. Includes commands for quality trimming, transcriptome assembly, and transcript quantification.
- **`okra_dge.R`**: R script for differential gene expression analysis using the DESeq2 package. It generates the following:
  - MA Plot (DESeq2 MA plot).
  - Volcano Plot (log2 Fold Change vs. Adjusted p-value).
  - Heatmap of top genes with significant expression changes.
- **`updown.py`**: Python script to filter genes based on log2 fold change and create separate CSV files for upregulated and downregulated genes.

## Methodology

### **Preprocessing**
1. **Trimmomatic**: Removed low-quality bases and adapters from RNA-Seq reads.
2. **Trinity**: Assembled transcriptome data from paired-end reads.
3. **Kallisto**: Indexed transcriptome and quantified transcript abundance.

### **Differential Gene Expression Analysis**
1. **DESeq2**: Identified differentially expressed genes under abiotic stress conditions using normalized counts.
2. **Python Post-Processing**: Filtered results into upregulated and downregulated genes for further downstream analysis.

### **Visualization**
Plots were generated to represent the expression changes and highlight significant genes.

## Tools and Dependencies
- **Trimmomatic**: RNA-Seq read quality trimming.
- **Trinity**: De novo transcriptome assembly.
- **Kallisto**: Quantification of transcript abundance.
- **DESeq2**: R package for DGE analysis.
- **ggplot2**: R package for data visualization.
- **Python (pandas)**: Data filtering and CSV creation.


