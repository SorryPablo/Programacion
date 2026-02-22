#Binom

#dbinom(100,size=200,prob=0.01)

#n<-10
#p<-0.1
#k<-0:n
#dist<-dbinom(k,n,p)
#plot(k,dist,type="h")

#1
x<-1:6;y<-1:8;
#p<-sum(outer(x,y)==12)/(6*8)
#dbinom(1,3,p)

#2
p<-2/5
#pbinom(2,5,p)
#dbinom(1,5,p)
#pbinom(3,5,p)

#3
p<-1/2
#dbinom(3,6,p)

#4
#rb<-rbinom(10000,5,0.3);
#rt<-table(rb)/10000
#mean(rb);var(rb);
#0.3*5;5*0.3*0.7

#5
#dbinom(4,8,0.5)
#rb<-rbinom(10000,8,0.5);
#sum(rb==4)/10000

#6
#pa<-0.4
#pb<-0.466
#a
#	1-pbinom(14,30,pa)
#b
#	1-pbinom(3,5,pa)
#c
#	y<-dbinom(1:5,5,pa);
#	x<-dbinom(1:5,5,pb);
#	w<-outer(x,y);z<-lower.tri(outer(x,y));
#	sum(w[z])

#7
#dgeom(4,1/6)

#8
#1-pgeom(3,1/6)

#9

p<-sum(apply(expand.grid(0:9, 0:9, 0:9, 0:9),1,sum)==20)/(10^4);
qgeom(0.99,p);

#10

x<-rgeom(10000,1/10)
mean(x);var(x);
(1-p)/p;

#11

qgeom(0.95,1/10)

#12

i=0:qpois(0.99,10)
barplot(dpois(i,lambda=10))

#13

1-pbinom(4,200,1/100)
1-ppois(4,2)

#14

qpois(0.9,2)


