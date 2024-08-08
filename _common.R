# example R options set globally
options(width = 60)

# example chunk options set globally
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE
  )


# This reads the list of files/directories under
# copy_resources: in _bookdown.yml and copies them
# to the output document folder.
library(yaml)
library(fs)

yaml_path <- "_bookdown.yml"
config <- yaml::read_yaml(yaml_path)
additional_resources <- config$copy_resources
output_dir <- config$output_dir

copy_resources <- function(resources, output_dir) {
  for (resource in resources) {
    if (fs::file_exists(resource)) {
      if (fs::is_file(resource)) {
        target <- file.path(output_dir, resource)
        fs::dir_create(fs::path_dir(target), recurse = TRUE)
        fs::file_copy(resource, target, overwrite = TRUE)
      }
      else if (fs::is_dir(resource)) {
        target <- file.path(output_dir, resource)
        fs::dir_create(fs::path_dir(target), recurse = TRUE)
        fs::dir_copy(resource, target, overwrite = TRUE)
      }
    } else if (grepl("[*?]", resource)) {
      files <- Sys.glob(resource)
      for (file in files) {
        target <- file.path(output_dir, file)
        fs::dir_create(fs::path_dir(target), recurse = TRUE)
        fs::file_copy(file, target, overwrite = TRUE)
      }
    } else {
      warning(paste("Resource", resource, "not found or not recognized."))
    }
  }
}


copy_resources(additional_resources, output_dir)