#!/usr/bin/env Rscript

check_pkgdown_topics <- function() {
  # Read in all the topics from _pkgdown.yaml.
  pkg_yml <- yaml::yaml.load_file("_pkgdown.yaml")
  pkgdown_topics <- unlist(lapply(pkg_yml$reference, \(x) x[["contents"]]))

  rd_files <- dir("man", pattern = ".rd", ignore.case = TRUE)
  missing <- lapply(rd_files, \(f) {
    this_file <- tools::parse_Rd(file.path("man", f))
    # Check if either the name or the alias is in the yaml.
    names <- unlist(lapply(
      this_file,
      \(x) if (is.list(x) & attr(x, "Rd_tag") %in% c("\\name", "\\alias")) x[[1]])
    )
    if (!any(names %in% pkgdown_topics)) f else NULL
  })
  missing <- unlist(missing)
  if (is.null(missing)) {
    print("Everything seems to be in _pkgdown.yaml! :)")
  } else {
    print(paste0("Might be missing these topics: ", paste0(missing, collapse = ", ")))
  }
}


check_pkgdown_topics()
