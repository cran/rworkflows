## ----echo=FALSE, include=FALSE------------------------------------------------
pkg <- read.dcf("../DESCRIPTION", fields = "Package")[1]
library(pkg, character.only = TRUE)

## -----------------------------------------------------------------------------
workflow <- rworkflows::use_workflow(run_bioccheck = FALSE, 
                                     run_rcmdcheck = TRUE,  
                                     run_pkgdown = TRUE, 
                                     run_docker = TRUE,
                                     docker_user = "bschilder",
                                     docker_org = "neurogenomicslab",
                                     ## Use default save_dir in practice
                                     save_dir = tempdir())

## -----------------------------------------------------------------------------
workflow_static <- rworkflows::use_workflow(name = "rworkflows_static",
                                     run_bioccheck = FALSE, 
                                     run_rcmdcheck = TRUE,  
                                     run_pkgdown = TRUE, 
                                     run_docker = TRUE,
                                     docker_user = "bschilder",
                                     docker_org = "neurogenomicslab",
                                     ## Use default save_dir in practice
                                     save_dir = tempdir())

## ----results='asis'-----------------------------------------------------------
badges <- rworkflows::use_badges()

## ----results='asis'-----------------------------------------------------------
## Use default save_dir in practice
dockerfile <- rworkflows::use_dockerfile(save_dir = tempdir()) 

## -----------------------------------------------------------------------------
## Use default save_dir in practice
readme <- rworkflows::use_readme(save_dir = tempdir())

## -----------------------------------------------------------------------------
## Use default save_dir in practice
vignette1 <- rworkflows::use_vignette_getstarted(package = "mypackage",
                                                 save_dir = tempdir())

## -----------------------------------------------------------------------------
## Use default save_dir in practice
vignette2 <- rworkflows::use_vignette_docker(docker_org = "neurogenomicslab",
                                             save_dir = tempdir())

## ----Session Info-------------------------------------------------------------
utils::sessionInfo()

