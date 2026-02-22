cl<-read.table("Alumnos2526B.csv",header=TRUE,sep=";",dec=",")

#tabla_grupo_equipo<- table(cl$Grupo, cl$Equipo)

#zapato_agrupado<-cut(cl$Zapato,breaks = c(34, 38, 43, 48))
#tabla_zapato_grupo<-table(cl$Grupo,zapato_agrupado)
#barplot(tabla_zapato_grupo,legend=c("Grupo A","Grupo B"),beside=T)
#ni.<-apply(tabla_zapato_grupo,1,sum)
#n.j<-apply(tabla_zapato_grupo,2,sum)
#n<-sum(ni.)
#Eij=outer(ni.,n.j)/n
#tabla_zapato_grupo[,]
#Chi2<-sum(((tabla_zapato_grupo-Eij)**2)/Eij);Chi2

nij<-matrix(c(20,8,934,1070,113,92),nrow=3,ncol=2,byrow=T)
colnames(nij)<-c("Hombre","Mujer")
rownames(nij)<-c("Ambidextro","Diestro","Zurdo")
ni.<-apply(nij,1,sum)
n.j<-apply(nij,2,sum)
n<-sum(ni.)
Eij=outer(ni.,n.j)/n
Chi2<-sum(((nij-Eij)**2)/Eij);Chi2