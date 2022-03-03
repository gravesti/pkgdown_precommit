#!/usr/bin/env Rscript

tryCatch(
  {
    pkgdown::build_reference_index()
    pkgdown::build_articles_index()
  },
  error = function(e) e,
  warning = function(w) stop(w)
)
