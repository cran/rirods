## ----setup, include = FALSE---------------------------------------------------
library(rirods)
library(httptest2)
start_vignette("local-irods")

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval=is_irods_demo_running()
)

root_dir <- tempdir()

knitr::opts_knit$set(
  root.dir = root_dir
)

## ----setup2, include=FALSE----------------------------------------------------
#  create_irods("http://localhost/irods-rest/0.9.3", "/tempZone/home", overwrite=TRUE)
#  iauth("rods", "rods")
#  
#  if (length(ils())> 0) {
#    for (file in ils()$logical_path) {
#      irm(file, recursive = TRUE, force=TRUE)
#    }
#  }
#  
#  dir.create(file.path(root_dir, "data"))
#  imkdir("data")
#  

## -----------------------------------------------------------------------------
#  getwd()
#  ipwd()

## -----------------------------------------------------------------------------
#  dir()
#  ils()

## ----include=FALSE------------------------------------------------------------
#  change_state()

## -----------------------------------------------------------------------------
#  old_local <- setwd("data")
#  dir()
#  old_irods <- icd("data")
#  ils()

## ----include=FALSE------------------------------------------------------------
#  change_state()

## -----------------------------------------------------------------------------
#  setwd(old_local)
#  getwd()
#  
#  icd(old_irods)
#  ipwd()

## ----include=FALSE------------------------------------------------------------
#  change_state()

## -----------------------------------------------------------------------------
#  dir.create("analysis")
#  dir()
#  
#  imkdir("analysis")
#  ils()

## -----------------------------------------------------------------------------
#  set.seed(1234)
#  fake_data <- data.frame(x = rnorm(20, mean = 1))
#  fake_data$y <- fake_data$x * 2 + 3 - rnorm(20, sd = 0.6)
#  write.csv(fake_data, file.path("data", "data.csv"), row.names=FALSE)
#  dir("data")

## ----include=FALSE------------------------------------------------------------
#  change_state()

## -----------------------------------------------------------------------------
#  iput("data/data.csv", "data/data_from_local.csv")
#  ils("data")

## -----------------------------------------------------------------------------
#  m <- lm(y ~ x, data = fake_data)
#  m

## ----include=FALSE------------------------------------------------------------
#  change_state()

## -----------------------------------------------------------------------------
#  isaveRDS(m, "analysis/linear_model.rds")
#  ils("analysis")
#  dir("analysis") # nothing was saved locally

## -----------------------------------------------------------------------------
#  iget("data/data_from_local.csv", "data/data_from_irods.csv")
#  dir("data")
#  read.csv("data/data_from_irods.csv") # same as fake_data

## -----------------------------------------------------------------------------
#  # copy locally first
#  iget("analysis/linear_model.rds", "analysis/linear_model_in_local.rds")
#  dir("analysis")
#  readRDS("analysis/linear_model_in_local.rds")
#  
#  # or read directly from iRODS
#  ireadRDS("analysis/linear_model.rds")

## ----include=FALSE------------------------------------------------------------
#  change_state()

## -----------------------------------------------------------------------------
#  unlink("analysis", recursive = TRUE)
#  dir()
#  
#  irm("data", recursive = TRUE, force = TRUE)
#  ils()

## ----cleanup, include=FALSE---------------------------------------------------
#  change_state()
#  for (file in ils()$logical_path) {
#    irm(file, recursive = TRUE, force=TRUE)
#  }
#  unlink(file.path(root_dir, "data"), recursive=TRUE)
#  unlink(file.path(root_dir, "analysis"), recursive=TRUE)
#  end_vignette()

