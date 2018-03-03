writeOut = function(dat,name){
  write.table(dat,file=name,quote = F,sep="\t",row.names = T,fileEncoding = "utf-8")
}