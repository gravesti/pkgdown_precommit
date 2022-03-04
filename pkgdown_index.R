#!/usr/bin/env Rscript

# options(warn = 2)
tryCatch(
  {
    pkgdown::build_reference_index()
    pkgdown::build_articles_index()
  },
  error = function(e) e,
  warning = function(w) stop(w)
)
