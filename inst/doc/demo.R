## ----setup, include = FALSE---------------------------------------------------
library(httptest2)
library(rirods)
start_vignette("demo")

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval=is_irods_demo_running()
)

## ----eval=FALSE---------------------------------------------------------------
#  library(rirods)
#  use_irods_demo()

## -----------------------------------------------------------------------------
#  create_irods("http://localhost/irods-rest/0.9.3", "/tempZone/home", overwrite = TRUE)
#  iauth("rods", "rods")
#  ils()

## ----include=FALSE------------------------------------------------------------
#  end_vignette()

