<img src= 'https://github.com/neurogenomics/rworkflows/raw/master/inst/hex/hex.png' height= '600' ><br><br><br><br>
[![](https://img.shields.io/badge/devel%20version-0.99.5-black.svg)](https://github.com/neurogenomics/rworkflows)
[![R build
status](https://github.com/neurogenomics/rworkflows/workflows/rworkflows/badge.svg)](https://github.com/neurogenomics/rworkflows/actions)
[![R build
status](https://github.com/neurogenomics/rworkflows/workflows/rworkflows_static/badge.svg)](https://github.com/neurogenomics/rworkflows/actions)
[![](https://img.shields.io/github/last-commit/neurogenomics/rworkflows.svg)](https://github.com/neurogenomics/rworkflows/commits/master)
[![](https://img.shields.io/github/languages/code-size/neurogenomics/rworkflows.svg)](https://github.com/neurogenomics/rworkflows)
[![](https://app.codecov.io/gh/neurogenomics/rworkflows/branch/master/graph/badge.svg)](https://app.codecov.io/gh/neurogenomics/rworkflows)
[![License:
GPL-3](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://cran.r-project.org/web/licenses/GPL-3)
[![](https://www.r-pkg.org/badges/version/rworkflows?color=blue)](https://cran.r-project.org/package=rworkflows)
[![CRAN
checks](https://badges.cranchecks.info/summary/rworkflows.svg)](https://cran.r-project.org/web/checks/check_results_rworkflows.html)
[![](http://cranlogs.r-pkg.org/badges/last-month/rworkflows?color=blue)](https://cran.r-project.org/package=rworkflows)
[![](http://cranlogs.r-pkg.org/badges/grand-total/rworkflows?color=blue)](https://cran.r-project.org/package=rworkflows)
¶ <h4> ¶ Authors: <i>Brian Schilder, Alan Murphy, Nathan Skene</i> ¶
</h4>
<h4> ¶ README updated: <i>Jan-09-2023</i> ¶ </h4>

## Intro

[*GitHub Actions*](https://docs.github.com/en/actions) are a powerful
way to automatically launch workflows every time you push changes to a
GitHub repository. This is a form of [*Continuous Integration
(CI)*](https://docs.github.com/en/actions/automating-builds-and-tests/about-continuous-integration),
which helps ensure that your code is always working as expected (without
having to manually check each time).

Here, we have designed a robust, reusable, and flexible *action*
specifically for the development of R packages. We also provide an R
function to automatically generate a *workflow file* that calls the
`rworkflows` composite action:

Currently, `rworkflows` *action* performs the following tasks:

1.  Builds a Docker container to run subsequent steps within.
2.  Builds and checks your R package (with
    [CRAN](https://cran.r-project.org/) and/or
    [Bioconductor](https://bioconductor.org/) checks).  
3.  Runs [units tests](https://testthat.r-lib.org/).  
4.  Runs [code coverage tests](https://covr.r-lib.org/) and uploads the
    results to [*Codecov*](https://about.codecov.io/).  
5.  (Re)builds and launches a documentation website for your R
    package.  
6.  Pushes an [*Rstudio*](https://posit.co/)
    [*Docker*](https://www.docker.com/) container to
    [*DockerHub*](https://hub.docker.com/) with your R package and all
    its dependencies pre-installed.

Importantly, these *workflow files* and *action* are designed to work
with any R package out-of-the-box. This means you won’t have to manually
edit any yaml files, just run the `rworkflows::use_workflow()` function
and you’re ready to go!

## Quickstart

Install and create the workflow in your R package’s project folder.

``` r
## in R
if(!require("rworkflows")) remotes::install_github("neurogenomics/rworkflows")
path <- rworkflows::use_workflow()
```

Push to GitHub, and let everything else run automatically!

``` bash
## in the Terminal
git add .
git commit -m "Added GHA workflow via rworkflows::use_workflow()"
git push
```

## Documentation

### [Get started](https://neurogenomics.github.io/rworkflows/articles/rworkflows.html)

Introductory tutorial for using `rworkflows`.

#### GitHub Secrets

Before pushing changes to your new R package, you will need to set up
one or more [GitHub
Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets):

- `PAT_GITHUB` \[Required\]: Speeds up installations and gives access to
  private repos on GitHub Actions. You can generate your very own
  Personal Authentication Token using [these
  instructions](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token).  
- `DOCKER_TOKEN` \[Optional\]: Allows GitHub Actions to push to a
  [DockerHub](https://hub.docker.com) account.

### [Docker/Singularity](https://neurogenomics.github.io/rworkflows/articles/docker)

Copy-and-paste instructions for creating a *Docker* or *Singularity*
container with the `rworkflows` R package pre-installed.

### [Dependency graph](https://neurogenomics.github.io/rworkflows/articles/depgraph)

Interactive graph showing all the GitHub repos that currently use the
`rworkflows` action.

## Citation

If you use `rworkflows`, please cite:

<!-- Modify this by editing the file: inst/CITATION  -->

> Brian M. Schilder, Alan E. Murphy, & Nathan G. Skene (2023) The
> rworkflows suite: automated continuous integration for quality
> checking, documentation website creation, and containerised deployment
> of R packages, *Research Square*;
> <https://doi.org/10.21203/rs.3.rs-2399015/v1>

## Acknowledgments

`rworkflows` builds upon the work of many others, especially the
following:

<details>

### [`biocthis`](https://github.com/lcolladotor/biocthis)

This workflow is derived from the workflow generated by the
[`use_bioc_github_action()`](https://lcolladotor.github.io/biocthis/articles/biocthis.html)
function within the
[`biothis`](http://www.bioconductor.org/packages/release/bioc/html/biocthis.html)
package.

#### Key changes in `rworkflows`

- Uses dynamic variables to specify R/Bioconductor versions
  (e.g. `r: "latest"`) and the name of your R package, as opposed to
  static names that are likely to become outdated (e.g. `r: "4.0.1"`).  
- Additional error handling and dependencies checks.  
- Re-renders `README.Rmd` before rebuilding the documentation website.

### [`actions/`](https://github.com/actions)

A general set of GitHub Actions.

### [`r-lib/actions`](https://github.com/r-lib/actions)

A set of GitHub Actions for R development.

### [`JamesIves/github-pages-deploy-action`](https://github.com/JamesIves/github-pages-deploy-action)

Builds and deploys the GitHub Pages documentation website in the
`rworkflows` GHA workflows.

### [`docker/build-push-action`](https://github.com/docker/build-push-action)

A set of GitHub Actions for building/pushing Docker containers.

### [`bioconductor_docker`](https://github.com/Bioconductor/bioconductor_docker)

Uses the official
[`bioconductor/bioconductor_docker`](https://github.com/Bioconductor/bioconductor_docker)
Docker container.

**NOTE**: Whenever a new version of Bioconductor is released, the
`bioconductor/bioconductor_docker` container will often lag behind the
actual Bioconductor releases for up to several days, due to the time it
takes to update the container. This means that sometimes “devel” in
`Bioconductor/bioconductor_docker` is actually referring to the current
“release” version of Bioconductor (i.e. the previous Bioc version’s
“devel”). For further details, see this
[Issue](https://github.com/Bioconductor/bioconductor_docker/issues/37),
and the [Bioconductor release
schedule](https://www.bioconductor.org/about/release-announcements/).

### [`scFlow`](https://github.com/combiz/scFlow)

This DockerFile was partly adapted from the [scFlow
Dockerfile](https://github.com/combiz/scFlow/blob/master/Dockerfile).

Unlike other Dockerfiles, this one **does not require any manual editing
when applying to different R packages**. This means that users who are
unfamiliar with Docker do not have to troubleshoot making this file
correctly. It also means that it will continue to work even if your R
package dependencies change.

### [`act`](https://github.com/nektos/act)

A very useful command line tool for testing *GitHub Actions* locally.

</details>

# Session Info

<details>

``` r
utils::sessionInfo()
```

    ## R version 4.2.1 (2022-06-23)
    ## Platform: x86_64-apple-darwin17.0 (64-bit)
    ## Running under: macOS Big Sur ... 10.16
    ## 
    ## Matrix products: default
    ## BLAS:   /Library/Frameworks/R.framework/Versions/4.2/Resources/lib/libRblas.0.dylib
    ## LAPACK: /Library/Frameworks/R.framework/Versions/4.2/Resources/lib/libRlapack.dylib
    ## 
    ## locale:
    ## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] BiocManager_1.30.19 compiler_4.2.1      pillar_1.8.1       
    ##  [4] RColorBrewer_1.1-3  yulab.utils_0.0.6   tools_4.2.1        
    ##  [7] digest_0.6.31       jsonlite_1.8.4      evaluate_0.19      
    ## [10] lifecycle_1.0.3     tibble_3.1.8        gtable_0.3.1       
    ## [13] pkgconfig_2.0.3     rlang_1.0.6         cli_3.5.0          
    ## [16] DBI_1.1.3           rstudioapi_0.14     rvcheck_0.2.1      
    ## [19] yaml_2.3.6          xfun_0.36           fastmap_1.1.0      
    ## [22] stringr_1.5.0       dplyr_1.0.10        knitr_1.41         
    ## [25] desc_1.4.2          generics_0.1.3      vctrs_0.5.1        
    ## [28] dlstats_0.1.6       rprojroot_2.0.3     grid_4.2.1         
    ## [31] tidyselect_1.2.0    here_1.0.1          glue_1.6.2         
    ## [34] R6_2.5.1            fansi_1.0.3         rmarkdown_2.19     
    ## [37] ggplot2_3.4.0       badger_0.2.2        magrittr_2.0.3     
    ## [40] scales_1.2.1        htmltools_0.5.4     rworkflows_0.99.5  
    ## [43] assertthat_0.2.1    colorspace_2.0-3    utf8_1.2.2         
    ## [46] stringi_1.7.8       munsell_0.5.0

</details>
