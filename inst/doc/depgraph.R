## -----------------------------------------------------------------------------
requireNamespace("htmltools")
library(data.table)

## ----fig.height=20, fig.width=20----------------------------------------------
htmltools::includeHTML("https://github.com/neurogenomics/rworkflows/raw/master/reports/rworkflows_depgraph.html")

## ----Session Info-------------------------------------------------------------
utils::sessionInfo()

