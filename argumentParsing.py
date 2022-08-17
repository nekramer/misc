import argparse

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('variantLocations', type = argparse.FileType(), 
    help = 'path to space-delimited file of variant locations with 2 columns: "chr" for chromosome name and "pos" for position.')
parser.add_argument('dbSNP',
    help = 'path to dbSNP file to be used for finding variant positions and rsids. The corresponding index must be in the same parent directory.')
parser.add_argument('output', 
    help = 'Desired output file name.')
args = parser.parse_args()