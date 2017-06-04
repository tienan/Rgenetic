Rmysql
#辅助函数

#    2.1 dbConnect，dbDisconnect  #数据库连接函数
#    2.2 dbListFields ,dbListTables,dbGetInfo,dbListResults,summary,dbGetException,dbExistsTable    #查看数据库或者参数信息

#查询函数

#    2.3 dbGetQuery    #查询函数
#    2.4 dbReadTable   #读取表的数据

#更新函数

#   2.5 dbWriteTable   #创建数据库表或者将数据写入对应的表
#    2.6 dbRemoveTable  # 删除数据库中的表

#dbSendQuery函数

#    2.7 dbSendQuery ,dbClearResult  #将query交给数据库引擎
#    2.8 dbColumnInfo，dbGetRowsAffected，dbGetRowCount，dbHasCompleted     #查看数据库引擎执行结果
#    2.9 dbFetch，fetch   #将dbSendQuery函数的结果抽取出来
#    2.10 dbNextResult，dbMoreResults   #一条一条读取结果

#事务函数

#   2.11 dbCommit，dbBegin，dbRollback 

install.packages("RMySQL")
library(RMySQL)

####For example
conn <- dbConnect(RMySQL::MySQL(),dbname="health",username="root",password="feng1234",host="172.29.1.30")


dbListTables(conn)
dbWriteTable(conn, "mtcars", mtcars)
dbWriteTable(conn, "mtcars", mtcars,append=T) 
dbListTables(conn)
dbListFields(conn, "mtcars")
dbReadTable(conn, "mtcars")

# You can fetch all results:
res <- dbSendQuery(conn, "SELECT * FROM mtcars WHERE cyl = 4")
dbFetch(res)
dbClearResult(res)

# Or a chunk at a time
res <- dbSendQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
while(!dbHasCompleted(res)){
  chunk <- dbFetch(res, n = 5)
  print(nrow(chunk))
}
# Clear the result
dbClearResult(res)

#提取数据
dbGetQuery(con, "SELECT * FROM mtcars")


# Disconnect from the database
dbDisconnect(con)


#sql 整合临床和基因数据

sql = "select l.sampleID,l.cancer,l.patientID,g.gene_id,g.normalized_count,c.gender,c.race,c.pathologic_T,c.pathologic_N,c.pathologic_M,c.pathologic_stage,c.tobacco_smoking_history,c.days_to_last_followup,c.days_to_death from clinic_luad as c,genes2id_link as l,LUAD_genes as g where c.bcr_patient_barcode=l.patientID and g.sample_id=l.sampleID"

res = dbGetQuery(conn , sql)

write.table(res,file="LUAD_genes_exp.txt",quote = F,sep="\t",row.names = F,fileEncoding = "utf-8")






