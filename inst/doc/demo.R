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
# library(rirods)
# use_irods_demo()

## ----echo=FALSE, comment=""---------------------------------------------------
# # set user config directory to temporary location
# withr::local_envvar(
#   R_USER_CONFIG_DIR = tempdir()
# )
# substitute(create_irods(x), list(x = rirods:::.irods_host))

## ----echo=FALSE---------------------------------------------------------------
# eval(substitute(create_irods(x), list(x = rirods:::.irods_host)))

## -----------------------------------------------------------------------------
# iauth("rods", "rods")
# ils()

## ----include=FALSE------------------------------------------------------------
# end_vignette()
# unlink(rirods:::path_to_irods_conf())

