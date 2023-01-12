construct_runners_check_args <- function(os,
                                         bioc,
                                         r,
                                         cont){
  if(!all(os %in% names(bioc))){
    stp <- paste("All `os` must be names of elements in `bioc_version`.")
    stop(stp)
  }
  if(!all(os %in% names(r))){
    stp <- paste("All `os` must be names of elements in `r`.")
    stop(stp)
  }
  if(!all(os %in% names(cont))){
    stp <- paste("All `os` must be names of elements in `cont`.")
    stop(stp)
  }
}