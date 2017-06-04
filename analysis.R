#analysis model 





genesName = levels(as.factor(res$gene_id))

expValue = data.frame()

for (i in 1:length(geneName)){
  t = res[res$gene_id==geneName[i],]
  expValue[i,1]=geneName[i]
  expValue[i,2]=mean(t$normalized_count)
  expValue[i,3]=sd(t$normalized_count)
  expValue[i,4] = sd(t$normalized_count)/mean(t$normalized_count)
} 

write.table(expValue,file="LUAD_expValue.txt",quote = F,sep="\t",row.names = F,fileEncoding = "utf-8")


