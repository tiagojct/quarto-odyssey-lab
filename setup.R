# setup.R — install the R packages this course needs.
# Run once, from RStudio, with the project open:
#   source("setup.R")
# It only installs what's missing, so it's safe to run again.

pkgs <- c("tidyverse", "gt", "knitr", "rmarkdown")
missing <- setdiff(pkgs, rownames(installed.packages()))

if (length(missing)) {
  message("Installing: ", paste(missing, collapse = ", "))
  install.packages(missing, repos = "https://cloud.r-project.org")
} else {
  message("All required packages already installed. You're ready.")
}
