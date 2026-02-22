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
M<-10000000
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
tam<-4 !Cuantas tiradas
x<- !Cuantos seises
B<-100 !Cuantas repeticiones
for(i in 1:B){
m<-sample(1:6,size=tam,replace=T)
if (sum(m==6)>=x) {win<-win+1}
}
win/B




