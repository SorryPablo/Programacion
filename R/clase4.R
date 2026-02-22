clase<-read.table("Alumnos2526B.csv",header=TRUE,sep=";",dec=",")

#fabs_equipo <- table(clase$Equipo)
#barplot(fabs_equipo,main="a",ylab="b",col=5)

#sexu<-table(clase$Sexo)
#par(mfrow = c(1,2))
#barplot(sexu,main="Sexo",ylab="Individuos",col=2)
#pie(sexu,main="Sexo",col=2)

#par(mfrow = c(1,2))
#fabs_hermanos<-table(clase$Hermanos)
#barplot(fabs_hermanos,main="Hermanos",ylab="ni",col=8)
#fabscum_hermanos<-cumsum(fabs_hermanos);fabscum_hermanos
#barplot(fabscum_hermanos,main="Hermanos",ylab="Ni",col=7)

#n<-sum(table(clase$Altura));n
#fabs_altura<-table(clase$Altura);fabs_altura/n


#n<-sum(table(clase$Equipo));n
#frel_equipo<-length(clase[,"Equipo"])/n;frel_equipo

#fabs_hermanos<-table(clase$Hermanos)
#n<-sum(table(clase$Hermanos));n
#fabs_hermanosfrec<-fabs_hermanos/n
#fabscum_hermanosfrec<-cumsum(fabs_hermanosfrec)
#barplot(fabscum_hermanosfrec,main="Hermanos",ylab="Fi",col=4)

#min(clase$Zapato)
#max(clase$Zapato)
#sum(clase$Zapato<=40)
#quantile(clase$Zapato,0.9)
#zapato_agrupado<-cut(clase$Zapato,breaks = c(34,38,42,48),include.lowest = T)

#hist(clase$Altura,freq=F,breaks = c(140,167.5,173,180,196),col=4)

#mean(clase$Altura)
#median(clase$Altura)
#fabs_equipo <- table(clase$Equipo)
#which(clase$Altura==max(clase$Altura))
#pdec<-seq(0.1,1,by = 0.1)
#quantile(clase$Altura,pdec)
#range(clase$Altura)
#diff(range(clase$Altura))
#max(clase$Altura)-min(clase$Altura)
#IQR(clase$Altura)

n<-sum(table(clase$Altura))
sum((clase$Altura-mean(clase$Altura))**2)/n
var(clase$Altura)
var(clase$Altura)*(n-1)/n
sd(clase$Altura)
sqrt(sum((clase$Altura-mean(clase$Altura))**2)/n)

boxplot(clase$Altura~clase$Sexo)
boxplot(clase$Altura~clase$Grupo)

