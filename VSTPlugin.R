library(dplyr)
library(Seurat)
library(patchwork)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")
source("RIO.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }
}

run <- function() {}

output <- function(outputfile) {
    pbmc <- readRDS(paste(pfix, parameters["rdsfile", 2], sep="/"))
pbmc <- FindVariableFeatures(pbmc, selection.method = "vst", nfeatures = as.integer(parameters["features", 2]))
write.csv(pbmc@assays$RNA@counts@i, paste(outputfile, "csv", sep="."))
    saveRDS(pbmc, outputfile)
}


