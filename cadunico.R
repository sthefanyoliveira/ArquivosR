
if(!require(data.table)){install.packages('data.table')}
if(!require('RPostgreSQL')){install.packages('RPostgreSQL')}



drv <- dbDriver("PostgreSQL")
USUARIO <- .rs.askForPassword("Usuário do Banco de dados:")
SENHA <- .rs.askForPassword("Senha do Banco de dados:")
HOST<-"santana-lcc.unifesspa.edu.br"
BANCO<-"politicas_publicas"
con <- dbConnect(drv, dbname = BANCO,
                 host = HOST, port = 5432,
                 user = USUARIO, password = SENHA)


setwd("c:/Users/netto/OneDrive/Documentos/Faculdade/Laboratório de Computação Científica - LCC/Projetos LCC 2020 - Supervisão Rogério/Projeto Prof. Daniel/base_amostra_cad_201512/")

data <- data.table::fread(input='base_amostra_pessoa_201512_20190131.csv',
                               integer64='character',
                               skip=0,  #Ler do inicio
                               encoding = "UTF-8",
                               nrow=-1, #Ler todos os registros
                               na.strings = "", 
                               showProgress = TRUE)

##########################################################################################
#Criar SCHEMA
dbSendQuery(con,"CREATE SCHEMA cadunico2015;")

#Escrever na tabela
dbWriteTable(con, c("cadunico2015","pessoa"), data, row.names=FALSE,append = TRUE)



