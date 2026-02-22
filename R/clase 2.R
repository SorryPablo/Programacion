a<-c(3,-1,2)
b<-matrix(c(2,1,1,1,-1,2,-1,1,3),3,3,byrow=TRUE)
solve(b)%*%a

tablaSuma<-outer(1:9,1:9,"+");tablaSuma
table(tablaSuma)
tSumas<-outer(1:9,1:9,1:9,"+");table(tSumas)