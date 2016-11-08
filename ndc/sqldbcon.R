
install.packages("RODBC")
library(RODBC)
driver.name <- "SQL Server"
db.name <- "baandb"
host.name <- "192.168.10.5" 
port <-"1433"
user.name <-"sa"
pwd <- "sa"


con.text <- paste("DRIVER=",driver.name,";Database=",db.name,
                  ";Server=",host.name,";Port=",port,
                  ";PROTOCOL=TCPIP",";UID=", user.name,
                  ";PWD=",pwd,sep="")


con1 <- odbcDriverConnect(con.text)
res <- sqlQuery(con1, 'select b.t_ccty as Country,a.t_pric as PRICE,a.t_copr as MATERIAL_COST,a.t_coop as OPERATION_COST,a.t_dqua as Quantity  from baandb.dbo.ttdsls045250 as a JOIN baandb.dbo.ttdsls041250 as b ON a.t_orno=b.t_orno and a.t_pono=b.t_pono')
View(res)
