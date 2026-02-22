clase<-read.table("Alumnos2526B.csv",header=TRUE,sep=";",dec=",")

fabs_equipo <- table(clase$Equipo)
barplot(fabs_equipo,main="a",ylab="b",col=5)




#n<-sum(table(clase$Equipo));n
#frel_equipo<-length(clase[,"Equipo"])/n;frel_equipo
