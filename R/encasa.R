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
#Chi<-sum(((tabla_zapato_grupo-Eij)**2)/Eij);Chi2

#nij<-matrix(c(20,8,934,1070,113,92),nrow=3,ncol=2,byrow=T)
#colnames(nij)<-c("Hombre","Mujer")
#rownames(nij)<-c("Ambidextro","Diestro","Zurdo")
#ni.<-apply(nij,1,sum)
#n.j<-apply(nij,2,sum)
#n<-sum(ni.)
#Eij=outer(ni.,n.j)/n
#Chi2<-sum(((nij-Eij)**2)/Eij);Chi2


#par(mfrow = c(1, 2))
#boxplot(cl$Altura[cl$Grupo=="Grupo A"],ylim=c(140,200),col='yellow')
#boxplot(cl$Altura[cl$Grupo=="Grupo B"],ylim=c(140,200),col="green")
#tapply(cl$Altura,cl$Grupo,quantile,c(0.5))
#tapply(cl$Altura,cl$Grupo,var)

#mean(cl$Altura[cl$Equipo=="RMA"])
#by(cl, cl$Grupo, summary)

a=-61.2789;b=0.7302
plot(cl$Altura,cl$Peso,main="Altura-Peso",xlab="Altura",ylab="Peso",pch=19,col="blue")
abline(a,b)
y.gorro=a+b*cl$Altura
e=cl$Peso-y.gorro
t<-cbind(cl$Peso,y.gorro,e)
#sum(t[,1])
#sum(t[,2])
sum(t[,3])

plot(cl$Altura[cl$Sexo==H],cl$Peso,main="Altura-Peso",xlab="Altura",ylab="Peso",pch=19,col="blue")
plot(cl$Altura[cl$Sexo==H],cl$Peso,main="Altura-Peso",xlab="Altura",ylab="Peso",pch=19,col="green")
