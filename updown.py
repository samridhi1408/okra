import pandas as pd
file_path = 'DESeq2_results.csv' 
df = pd.read_csv(file_path)
upregulated_df = df[df['log2FoldChange'] > 2]
downregulated_df = df[df['log2FoldChange'] < -2]
upregulated_ids = upregulated_df.iloc[:, 0]
downregulated_ids = downregulated_df.iloc[:, 0]
upregulated_ids.to_csv('upregulated.csv', index=False)
downregulated_ids.to_csv('downregulated.csv', index=False)
print("Files saved as upregulated_tf_ids.csv and downregulated_tf_ids.csv")
