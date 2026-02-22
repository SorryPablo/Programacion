cl<-read.csv2("Alumnos2526.csv");

sex_alt<-table(cl$Sexo=="M",cl$Altura>163)
sum(sex_alt["TRUE","TRUE"])/sum(cl$Sexo=="M")
sum(cl$Sexo=="M" & cl$Altura>163)/sum(cl$Sexo=="M")


pes_H<-table(cl$Sexo=="H",cl$Peso);

mean(cl$Sexo=="H" & cl$Peso)

n<-nrow(cl)
sum(cl$Peso>70 & cl$Altura>170)/n


carn<-table(cl$Carne==5,cl$Sexo)
carn<-carn[,c("H","M")]
ni.<-apply(carn,1,sum);n.j<-apply(carn,2,sum);
Eij<-outer(ni.,n.j);
sum(((carn-Eij)^2)/Eij)

#boxplot(cl$Altura~cl$Grupo)

puntos<-c(1,1,1,1,2);total=numeric();N<-10000
for (i in 1:N) {
	pA=0;pB=0;
	for (j in 1:5) {
		aciertoA<-sample(c(0,1),size=5,replace=TRUE,prob=c(0.65, 0.35))
		aciertoB<-sample(c(0,1),size=5,replace=TRUE,prob=c(0.67, 0.33))
		pA<-pA + puntos*aciertoA
		pB<-pB + puntos*aciertoB
	}
	if (sum(pB) >= sum(pA)) {total[i]=1} else {total[i]=0}
}
sum(total)/N