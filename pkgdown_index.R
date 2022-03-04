#!/usr/bin/env Rscript

error_fun <- stop
tryCatch(
  {
    pkgdown::build_reference_index()
    pkgdown::build_articles_index()
  },
  error = function(e) e,
  warning = function(w) error_fun(w)
)
