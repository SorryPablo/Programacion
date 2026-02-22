#Clase 7

#u<-sample(6, size=10000,replace=T)
#v<-table(u)
#sum(v)
#v/sum(v)
#sum((v/sum(v))[c(T,F)])

#MONO/CARTAS

tam<-15
N<-10000
t<-numeric()
for(i in 1:N){
m<-sample(tam,size=tam,replace=F)
t[i]=sum(m==1:tam)
}

#mean(t)
#sum(t==1)/N
#sum(t==0)/N

f<-numeric()
for(i in 0:tam){
f[i]<-sum(t==i)
}
fr<-f/N;fr

#MATRICULAS

m<-numeric()
M<-10000
total20 <- 0
for(i in 1:M){
mat<-sample(0:9,size=4,replace=T)
su<-sum(mat)
total20 <- total20 + (su == 20)
}
total20/M
#P REAL:
mean(apply(expand.grid(0:9,0:9,0:9,0:9),1,sum)==20)

#MÉRÉ

win<-0
tam<-4 
x<-1
B<-10000
for(i in 1:B){
	m<-sample(1:6,size=tam,replace=T)#,prob=c(0.5,0.1,0.1,0.1,0.1,0.1))
	if (sum(m==6)>=x) {win<-win+1}
}
win/B

#9
win<-0
tam<-2
x<-1
B<-10000
for(i in 1:B){
	m<-sample(2:12,size=tam,replace=T,prob=c(1/36,2/36,3/36,4/36,5/36,6/36,5/36,4/36,3/36,2/36,1/36))
	if (sum(m==12)>=x) {win<-win+1}
}
win/B

#10
acertos<-numeric()
for (i in 1:B){
	m<-sample(0:1,size=5,replace=T,prob=c(0.6,0.4))
	acertos[i]<-sum(m)
}
#barplot(table(acertos))

#Funcion 12-13

chi2<-function(nij){
	ni<-apply(nij,1,sum)
	nj<-apply(nij,2,sum)
	n<-sum(ni)
	Eij=outer(ni,nj)/n
	b<-sum(((nij-Eij)**2)/Eij)
	return(b)
}

x<-numeric();y<-numeric();chi<-numeric();
B<-100;
C<-100;
for(j in 1:C){
for(i in 1:B){
	m<-sample(1:6,size=2,replace=T)
	if(m[1]<=3){x[i]=1}
	else if(m[1]>3){x[i]=2}
	if(m[2]<=2){y[i]=1}
	else if(m[2]<=4){y[i]=2}
	else if(m[2]<=6){y[i]=3}
}
table(x,y);
chi[j]<-chi2(table(x,y))
}
quantile(chi,0.95)

#14
atip<-function(x,k=1.5){
	q3<-quantile(x,0.75);q1<-quantile(x,0.25);RI<-q3-q1;
	b<-x[(x<(q1-k*RI))|(x>(q3+k*RI))]
	return(b)
}
x<-rnorm(1000)
atip(x)

#11 Opcional

e<-1/3
i<-1/2
D<-10000
#Usar paquete expm
markov<-matrix(c(0,e,e,e,0,0,0,0,i,i,0,0,0,0,0,i,0,i,0,e,0,0,e,e,0,0,0,i,0,i,i,0,0,i,0,0),6,6,byrow=T)
m<-markov%^%1000;m
#Para hacerlo de la manera correcta habría que hacer un bucle con prob=sample(markov,i,:)


