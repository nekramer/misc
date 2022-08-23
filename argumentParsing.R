library(optparse)

option_list <- list(
    make_option(c("--file"), type = "character", default = NULL,
                help = "Input file of snps with location and rsid (chr column, pos column, rsid column)."),
    make_option(c("--txdb"), type = "character", default = "TxDb.Hsapiens.UCSC.hg38.knownGene",
                help = "Name of TxDb to use for gene transcript information or a path to a custom sqlite TxDb. (default %default)"),
    make_option(c("--orgdb"), type = "character", default = "org.Hs.eg.db",
                help = "Name of orgDb to use for gene symbol information. (default %default)"),
    make_option(c("--output"), type = "character", default = NULL,
                help = "Name of desired output file.")
)

opt_parser <- OptionParser(option_list = option_list)
opt <- parse_args(opt_parser)