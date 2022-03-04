"Attempt to build {pkgodwn} indexes during a precommit.
Usage:
  pkgdown-index [--warn_only]
Options:
  --warn_only  Print warnings instead of blocking the commit. Should be
               used with `verbose: True` in `.pre-commit-config.yaml`.
               Otherwise, warnings will never be shown to the user.
" -> doc

arguments <- docopt::docopt(doc)

error_fun <- if (arguments$warn_only) force else stop

tryCatch(
  {
    pkgdown::build_reference_index()
    pkgdown::build_articles_index()
  },
  error = function(e) e,
  warning = function(w) error_fun(w)
)
