library (DBI)
library(RODBC)
library(odbc)
con <- dbConnect(odbc::odbc(), "post")

dbGetQuery(con, 'SELECT * FROM File1')

dbGetQuery(con, 'SELECT * FROM public."HoteisMaraba")
