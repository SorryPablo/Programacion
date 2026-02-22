clase<-read.csv2('Alumnos2526.csv')

sum(clase$Sexo=="H" & clase$Altura>=170)/sum(table(clase$Sexo=="H"))

mean(clase$Altura[clase$Sexo=="M"])

sum(clase$Altura>=175 & clase$Peso>70)/sum(clase$Altura>170)

clase2<-clase[clase$Sexo %in% c("H","M"),]
nij<-table(clase2$Equipo=="RMA",clase2$Sexo=="H")
ni.<-apply(nij,1,sum);n.j<-apply(nij,2,sum);n=sum(ni.)
Eij<-outer(ni.,n.j)/n;
sum(((nij-Eij)^2)/Eij)

#boxplot(clase$Peso~clase$Grupo)

apa<-numeric();apb<-numeric()
for (j in 1:10000) {
	n<-sample(0:2,size=1,replace=T,prob=c(0.5,0.3,0.2))
	m<-sample(0:2,size=1,replace=T,prob=c(0.5,0.3,0.2))
	mx<-max(n,m)-1
	mn<-min(n,m)-0.3
	apa[j]<-mx
	apb[j]<-mn
}
mean(apa);mean(apb)
