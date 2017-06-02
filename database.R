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




