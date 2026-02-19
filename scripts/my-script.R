# Try to load a package NOT in the renv to verify isolation
result <- tryCatch({
  library(praise)
  "ERROR: praise loaded - renv isolation not working!"
}, error = function(e) {
  "SUCCESS: praise not available - renv is properly isolated!"
})

# Get versions of key packages
library(ggplot2)
library(dplyr)

ggplot2_version <- as.character(packageVersion("ggplot2"))
dplyr_version <- as.character(packageVersion("dplyr"))

# Write results to file
output <- c(
  result,
  paste("ggplot2 version:", ggplot2_version),
  paste("dplyr version:", dplyr_version)
)

writeLines(output, "results/r.txt")
