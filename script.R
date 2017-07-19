# 1:7 and 8:11 cor
# 1:7 and 12:13 cor 
# For Guo Changjun
res = data.frame()
name = c()
colName = colnames(dat)
k=1
for (i in 1:7){
  for (j in 8:13){
    c = cor.test(dat.scale[,i],dat[,j])
    res[k,1] = c$statistic
    res[k,2] = c$p.value
    res[k,3] = c$estimate
    name[k] = paste(colName[i],colName[j],sep = "+")
    k=k+1
  }
}

rownames(res)=name
colnames(res) = c("统计值","P值","相关系数")
res = round(res,2)
write.table(res,quote = F,sep="\t",row.names = T,fileEncoding = "utf-8")


