library(org.Hs.eg.db)
library(AnnotationDbi)


getGeneSymbol <- function(gene_id, id_type = "ENSEMBL"){
    geneSymbols <- AnnotationDbi::select(orgs_db, keys = gene_id, columns = "SYMBOL", keytype = id_type)
    return(geneSymbols)
}

