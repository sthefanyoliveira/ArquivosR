
con <- dbConnect(odbc::odbc(), "post")

setwd('c:/Users/sicom/Desktop/BD_HOTEIS_MARABA')

DBI::dbWriteTable(con,"Lista_Hoteis1.csv")