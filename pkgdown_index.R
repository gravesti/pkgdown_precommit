#!/usr/bin/env Rscript

check_pkgdown <- function() {
  tryCatch(
    {
      pkgdown::build_reference_index()
      pkgdown::build_articles_index()
    },
    error = function(e) e,
    warning = function(w) stop(w)
  )
}

check_pkgdown()
