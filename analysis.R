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
#filter using CV coefficient
candidatGenes = expValue[expValue$V4<23.95 & expValue$V4>1,1] 


candidatGenesExp = res[res$gene_id==candidatGenes[1],]$normalized_count

for (i in 2:length(candidatGenes)){
  candidatGenesExp=cbind(candidatGenesExp,res[res$gene_id==candidatGenes[i],]$normalized_count)
}

candidatGenesExp=cbind(candidatGenesExp,res[res$gene_id==pdia3p[1,1],]$normalized_count)
candidatGenesExp=cbind(candidatGenesExp,res[res$gene_id==hmgb1[1,1],]$normalized_count)
hmgb1 = res[grepl("hmgb1",res$gene_id,ignore.case=T),c(3,4)]  
hmgb1 = res[grepl("pdia3p",res$gene_id,ignore.case=T),c(3,4)]  

na.omit(c(candidatGenes,hmgb1[1,1],pdia3p[1,1])) -> genens
colnames(candidatGenesExp)[c(8576,8577)] = c(pdia3p[1,1],hmgb1[1,1])


tmp = candidatGenesExp[,colnames(candidatGenesExp)%in%as.vector(genens)]





# using reg to find the gene

grepl("YY1",rownames(corMat))






write.table(res,file="LUAD_methylation.txt",quote = F,sep="\t",row.names = F,fileEncoding = "utf-8")

write.table(expValue,file="LUAD_expValue.txt",quote = F,sep="\t",row.names = F,fileEncoding = "utf-8")

install.packages("apcluster")

library(apclustera)





s = corSimMat(t(tmp), sel=NA, r=1, signed=TRUE, method="pearson")

apres1b = apcluster(s)


tiff(filename = "heatmap_luad.tif",width = 3000, height = 3000, units = "px", pointsize = 12,compression ="lzw",bg = "white", res = 300)
heatmap(apres1b,s)
dev.off()



x[apply(x, 1, function(x) !all(is.na(x))),]

