#!/usr/bin/env Rscript

# options(warn = 2)
tryCatch(
  {
    pkgdown::build_reference_index()
    pkgdown::build_articles_index()
  },
  warning = function(w) error_fun(w)
)
