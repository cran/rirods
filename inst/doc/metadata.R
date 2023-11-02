## ----setup, include = FALSE---------------------------------------------------
library(rirods)
library(purrr)
library(kableExtra)
library(httptest2)
start_vignette("metadata")

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval=is_irods_demo_running()
)

knitr::opts_knit$set(
  root.dir = tempdir()
)

options(knitr.kable.NA = "")

## ----setup2, include=FALSE----------------------------------------------------
#  create_irods("http://localhost/irods-rest/0.9.3", "/tempZone/home", overwrite=TRUE)
#  iauth("rods", "rods")
#  
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
#  
#  if (length(ils())> 0) {
#    for (file in ils()$logical_path) {
#      irm(file, recursive = TRUE)
#    }
#  }
#  
#  patterns <- c("X_ID", "X_NAME", "X_CREATE_TIME", "X_MODIFY_TIME", "X_SIZE",
#                paste0("META_X_ATTR_", c("NAME", "VALUE", "UNITS")),
#                paste0("META_X_", c("ID", "CREATE_TIME", "MODIFY_TIME")))
#  possible_columns <- data.frame(
#    attribute = c("id", "name", "creation time", "modification time", "size",
#                  "attribute name", "value", "units", "id", "creation time", "modification time"),
#    collection = gsub("X", "COLL", patterns),
#    data_object = gsub("X", "DATA", patterns)
#  )
#  possible_columns[5,"collection"] <- NA

## -----------------------------------------------------------------------------
#  ils()

## -----------------------------------------------------------------------------
#  set.seed(1234)
#  fake_data <- data.frame(x = rnorm(20, mean = 1))
#  fake_data$y <- fake_data$x * 2 + 3 - rnorm(20, sd = 0.6)
#  m <- lm(y ~ x, data = fake_data)
#  m

## ----include=FALSE------------------------------------------------------------
#  change_state()

## -----------------------------------------------------------------------------
#  data_path <- "data.csv"
#  lm_path <- "analysis/linear_model.rds"
#  write.csv(fake_data, data_path) # write locally
#  iput(data_path, data_path) # transfer to iRODS
#  imkdir("analysis") # create directory
#  # save directly as rds
#  isaveRDS(m, lm_path)

## -----------------------------------------------------------------------------
#  ils(metadata=TRUE)
#  ils("analysis", metadata=TRUE)

## ----include=FALSE------------------------------------------------------------
#  change_state()

## -----------------------------------------------------------------------------
#  imeta(data_path, operations = list(
#    list(operation = "add", attribute = "nrow", value = as.character(nrow(fake_data)))
#    ))
#  filter_ils(data_path, ils(metadata=TRUE))

## ----include=FALSE------------------------------------------------------------
#  change_state()

## -----------------------------------------------------------------------------
#  imeta(data_path, operations = list(
#    list(operation = "add", attribute = "size", value = as.character(nrow(fake_data)), units = "rows"),
#    list(operation = "add", attribute = "size", value = as.character(length(fake_data)), units = "columns"),
#    list(operation = "remove", attribute = "nrow", value = as.character(nrow(fake_data)))
#    ))
#  filter_ils(data_path, ils(metadata=TRUE))

## -----------------------------------------------------------------------------
#  lm_meta <- data.frame(
#      attribute = c("size", "size", "data_file", "model_type"),
#      value = c(as.character(nrow(fake_data)), 1, data_path, "linear regression"),
#      units= c("observations", "predictors", "", "")
#  )
#  lm_meta

## ----include=FALSE------------------------------------------------------------
#  change_state()

## -----------------------------------------------------------------------------
#  lm_meta$operation <- "add"
#  imeta(lm_path, operations = lm_meta)
#  filter_ils("linear_model", ils("analysis", metadata=TRUE))

## ----include=FALSE------------------------------------------------------------
#  change_state()

## ----message=FALSE, results="hide"--------------------------------------------
#  file_md <- data.frame(
#    path = c(data_path, lm_path),
#    type = c("dataframe", "lm"),
#    responsible = c("abby", "bob")
#  )
#  pmap(file_md, function(path, type, responsible) {
#    imeta(path, operations = list(
#      list(operation = "add", attribute = "type", value = type),
#      list(operation = "add", attribute = "responsible", value = responsible)
#    ))
#  })

## -----------------------------------------------------------------------------
#  ils(metadata=TRUE)
#  ils("analysis", metadata=TRUE)

## ----include=FALSE------------------------------------------------------------
#  change_state()

## -----------------------------------------------------------------------------
#  imeta(
#    "analysis",
#    "collection",
#    operations = list(
#      list(operation = "add", attribute = "dataset", value = data_path)
#    ))
#  ils(metadata=TRUE)

## -----------------------------------------------------------------------------
#  iquery("SELECT COLL_NAME, DATA_NAME")

## -----------------------------------------------------------------------------
#  iquery("SELECT COLL_NAME, DATA_NAME, META_COLL_ATTR_VALUE WHERE META_COLL_ATTR_NAME LIKE 'data%'")

## -----------------------------------------------------------------------------
#  iquery("SELECT DATA_NAME, DATA_SIZE, META_DATA_ATTR_VALUE, META_DATA_ATTR_UNITS WHERE META_DATA_ATTR_NAME = 'size'")

## -----------------------------------------------------------------------------
#  iq <- iquery("SELECT COLL_NAME, DATA_NAME, DATA_CREATE_TIME, DATA_SIZE WHERE COLL_NAME LIKE '%analysis' AND DATA_SIZE < '8000'")
#  iq
#  class(iq$DATA_CREATE_TIME)
#  class(iq$DATA_SIZE)

## ----echo = FALSE-------------------------------------------------------------
#  kbl(possible_columns,
#      col.names = c("Attribute", "Collection", "Data object")) |>
#    pack_rows(index = c("Entity level" = 5, "Metadata level" = 6)
#    )

## -----------------------------------------------------------------------------
#  iq$PATH <- file.path(iq$COLL_NAME, iq$DATA_NAME)
#  iq

## ----cleanup, include=FALSE---------------------------------------------------
#  file.remove(data_path)
#  for (file in ils()$logical_path) {
#    irm(file, recursive = TRUE)
#  }
#  httptest2::end_vignette()

