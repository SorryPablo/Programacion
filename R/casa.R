#ejercicio 20 del boletín

r<-numeric()
N<-100
for (i in 1:N){
	m<-sample(1:365,size=38)
	n<-sample(1:365,size=5,replace=T)
	r[i]=0
	for (j in 1:5){
		if (any(m)==any(m[1:j-1])){r[1]=1}
	}
	if (any(m == n)){
		r[i]=1
	}
}
sum(r)/N
