## ----setup, include = FALSE---------------------------------------------------
library(rirods)
library(httptest2)

start_vignette("icommands")

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval=is_irods_demo_running()
)

knitr::opts_knit$set(
  root.dir = tempdir()
)


## ----setup2, include=FALSE----------------------------------------------------
#  create_irods("http://localhost/irods-rest/0.9.3", "/tempZone/home", overwrite=TRUE)
#  iauth("rods", "rods")
#  if (length(ils())> 0) {
#    for (file in ils()$logical_path) {
#      irm(file, recursive = TRUE)
#    }
#  }
#  imkdir("some_collection")
#  x <- rnorm(100)
#  isaveRDS(x, "some_collection/random_numbers.rds")
#  imkdir("some_collection/subcollection")
#  imeta("some_collection/random_numbers.rds",
#        operations = list(
#          list(operation="add", attribute="length", value="100", units="items"),
#          list(operation="add", attribute="distribution", value="normal")
#        ))
#  y <- rnorm(200)
#  isaveRDS(y, "200numbers.rds")

## -----------------------------------------------------------------------------
#  ils() # ils
#  ils("some_collection") # ils some_collection
#  ils("some_collection", stat=TRUE) # ils -l some_collection
#  ils("some_collection", permissions=TRUE) # ils -A some_collection
#  ils(permissions=TRUE, stat=TRUE) # ils -Al

## -----------------------------------------------------------------------------
#  filter_ils <- function(pattern, ils_output = ils()) {
#    stopifnot(inherits(ils_output, "irods_df"))
#    ils_df <- as.data.frame(ils_output)
#    if (length(pattern) == 1) {
#      filtered <- ils_df[grepl(pattern, ils_df$logical_path),]
#    } else {
#      filtered <- ils_df[basename(ils_df$logical_path) %in% pattern,]
#    }
#    rirods:::new_irods_df(filtered)
#  }

## -----------------------------------------------------------------------------
#  my_files <- ils("some_collection", metadata=TRUE)
#  my_files
#  filter_ils("random", my_files) # imeta ls -d some_collection/random_numbers.rds

## ----include=FALSE------------------------------------------------------------
#  change_state()

## -----------------------------------------------------------------------------
#  imkdir("new_collection") # imkdir new_collection
#  ils()
#  
#  # imkdir -p another_collection/subcollection
#  imkdir("another_collection/subcollection", create_parent_collections = TRUE)
#  
#  ils()
#  ils("another_collection")

## ----include=FALSE------------------------------------------------------------
#  change_state()

## -----------------------------------------------------------------------------
#  irm("200numbers.rds", force = FALSE) # irm 200numbers.rds
#  ils("/tempZone/trash/home/rods")
#  
#  irm("another_collection", force = TRUE, recursive = TRUE) # irm -rf another_collection
#  iquery("SELECT COLL_NAME WHERE COLL_NAME LIKE '%_collection'")

## ----include=FALSE------------------------------------------------------------
#  change_state()

## -----------------------------------------------------------------------------
#  icd("some_collection")
#  ils(metadata=TRUE)
#  
#  # imeta add -C subcollection foo bar baz
#  imeta("subcollection", "collection",
#        operations = list(
#          list(operation="add", attribute="foo", value="bar", units="baz")
#          )
#        )
#  
#  # imeta rm -d random_numbers.rds distribution normal
#  imeta("random_numbers.rds",
#        operations = list(
#          list(operation="remove", attribute="distribution", value="normal")
#        ))
#  
#  ils(metadata=TRUE)

## ----include=FALSE------------------------------------------------------------
#  change_state()

## -----------------------------------------------------------------------------
#  # imeta mod -d random_numbers.rds length 100 items u:elements
#  imeta("random_numbers.rds",
#        operations = list(
#          list(operation="remove", attribute="length", value="100", units="items"),
#          list(operation="add", attribute="length", value="100", units="elements")
#        ))
#  ils(metadata=TRUE)

## ----cleanup, include=FALSE---------------------------------------------------
#  if (length(ils())> 0) {
#    for (file in ils()$logical_path) {
#      irm(file, recursive = TRUE)
#    }
#  }
#  if (length(ils("/tempZone/trash/home/rods"))> 0) {
#    for (file in ils("/tempZone/trash/home/rods")$logical_path) {
#      irm(file, recursive = TRUE)
#    }
#  }
#  end_vignette()

