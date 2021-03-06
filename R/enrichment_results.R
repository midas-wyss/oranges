enrichment_results <- function(genes_pathway, number_genes, gene_ratio, nominal_p, p_adj) {
  enr <- tibble::tibble(data_source = cpdb_data$pathway_info$pathway_source,
                        name = cpdb_data$pathway_info$pathway_name,
                        number_genes = number_genes,
                        gene_ratio = gene_ratio,
                        pathway_proportion = sapply(gene_ratio, function(s) (as.numeric(strsplit(s, "\\/")[[1]]) / max(as.numeric(strsplit(s, "\\/")[[1]])))[1]),
                        p_val = nominal_p,
                        padj = p_adj,
                        genes = genes_pathway)
  
  enr <- enr %>% dplyr::filter(., number_genes != 0)
  
  return(enr)
}