titanic<-read.table("titanic.csv",header=TRUE,dec=".",sep=";")

#1
n<-nrow(titanic);n

#2
s<-sum(titanic$survived==1);s

#3
ps<-s/n;ps

#4
c1<-sum(titanic$pclass==1);c1

#5
age12<-sum(titanic$age<12);age12

#6
frc1<-sum(titanic$pclass==1)/n;frc1
frc2<-sum(titanic$pclass==2)/n;frc2
frc3<-sum(titanic$pclass==3)/n;frc3

#7
ti_pclass<-table(titanic$pclass)
#barplot(ti_pclass)

#8
#hist(titanic$age,freq=FALSE)

#9
mean(titanic$age)
quantile(titanic$age,0.5)

#10
fsm<-sum(titanic$survived==1 & titanic$sex=="female");fsm/sum(titanic$sex=="female")
fsf<-sum(titanic$survived==1 & titanic$sex=="male");fsf/sum(titanic$sex=="male")
fsnen<-sum(titanic$survived==1 & titanic$age<12);fsnen/sum(titanic$age<12)
#Sí

#11
fsc1<-sum(titanic$survived==1 & titanic$sex=="male" & titanic$pclass==1);fsc1/sum(titanic$sex=="male" & titanic$pclass==1)
fsc2<-sum(titanic$survived==1 & titanic$sex=="male" & titanic$pclass==2);fsc2/sum(titanic$pclass==2 & titanic$sex=="male")
fsc3<-sum(titanic$survived==1 & titanic$sex=="male" & titanic$pclass==3);fsc3/sum(titanic$pclass==3 & titanic$sex=="male")

#12
fspS<-sum(titanic$survived==1 & titanic$embarked=="S");fspS/sum(titanic$embarked=="S")
fspC<-sum(titanic$survived==1 & titanic$embarked=="C");fspC/sum(titanic$embarked=="C")
fspQ<-sum(titanic$survived==1 & titanic$embarked=="Q");fspQ/sum(titanic$embarked=="Q")

#13
#boxplot(titanic$age~titanic$pclass)

#14
tapply(titanic$age,titanic$pclass,mean)
tapply(titanic$age,titanic$pclass,var)

#15
quantile(titanic$age,0.95)

#16
max(titanic$age)

#17
