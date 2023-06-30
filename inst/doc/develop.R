## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----prof, eval=FALSE---------------------------------------------------------
#  # dependency management
#  options(renv.settings.snapshot.type = "explicit")
#  source("renv/activate.R")
#  
#  # development key (create key with httr2::secret_make_key() and place in user
#  # level environment variables. One can use usethis::edit_r_environ() for this.
#  # Store the key under "DEV_KEY_IRODS")
#  
#  # iRODS environment variables for development
#  Sys.setenv(DEV_HOST_IRODS = "nLO8T0IpHCT2kXklYE-IB0HjYpNkg5wN4ZKk7TPSvkwGf9FauDR-O5mVI-mmD2_zNFGLoaVcAgYl")
#  Sys.setenv(DEV_ZONE_PATH_IRODS = "gunp5Ts08NHfpKAdbFCBuilVb7Wjnxojbt7bA1e-9Q")
#  Sys.setenv(DEV_USER = "ZGlORquE2G6BIPS5JAcuPcngmBB6Wg")
#  Sys.setenv(DEV_PASS = "ZGlORquE2G6BIPS5JAcuPcngmBB6Wg")

## ----key, eval=FALSE----------------------------------------------------------
#  httr2::secret_make_key()

## ----host, eval=FALSE---------------------------------------------------------
#  httr2::secret_encrypt("http://myserver/irods-rest/0.9.3" ,"DEV_KEY_IRODS")

