GUION 0


sum(x) suma de los elementos de x
cumsum(x) vector con la suma acumulada hasta cada componente x
prod(x) producto de los elementos de x
cumprod(x) Vector con producto acumulado de x
max(x) máximo de x
min(x) mínimo de x
length(x) longitud de x
sort(x) ordena los elementos de x de menor a mayor
mean(x) media aritmética de x
union(x, y) Union de los vectores x e y sin repetir
intersect(x, y) Comunes sin repetir en los vectores x e y
setdiff(x, y) Cuáles de x no est´an en y

GUION 1

Vectores: x<-c(3, 5, 12)
Secuancial: x<-seq(2, 100, by = 2) // 1:10
Repetir: sexo <- rep(c("Hombre", "Mujer"), c(27, 18))
Vectores en vectores: u[c(T, F)]

Matriz: a <- matrix(10:15, nrow = 2, ncol = 3,byrow=T)
Reshape: dim(x)= c(2,3)
Matriz a partir de combi.: d <- cbind(x, 2 * x, w); e <- rbind(x, w);
Acceder a elementos de la matriz: a[ ,c(2,3)] (Aquí no se usa ':')

dim(A): dimensión de A
nrow(A): n´umero de filas de A
ncol(A): n´umero de columnas de A
rownames(A): nombre de las filas de A
colnames(A): nombre de las columnas de A
t(A): traspuesta de la matriz A
solve(A): inversa de A
rowMeans(A): medias por filas
rowSums(A): sumas por filas
colMeans(A): medias por columnas
colSums(A): sumas por columnas


Operaciones vectoriales: Sumas <- outer(1:6, 1:6, "+")
Producto matricial: %*%
Compacta con una operación:  apply(Datos, Colum/Filas , Función)

		Header Sep Dec 
read.table  FALSE  " " "."
read.csv    TRUE   "," "."
read.csv2   TRUE   ";" ","

<	menor que
<= 	menor o igual que
> 	mayor que
>= 	mayor o igual que
== 	igual a
!= 	no igual a

any();all();
Peso[Sexo == "H"] o con la formula más pero más general:

GUION 2

Nueva ventana de graficos:   windows()
Divide en secciones la grafica:  par(mfrow = c(1, 2))
Grafica de tarta:    pie(fabs_equipo)
Grafica de barras:   barplot(fabs_equipo, main = "Diag. de barras", ylab = "Frec. Abs", col = 2)
Diagrama de barras acumulado:   barplot(cumsum(),...)
Dividir en secciones unos datos:   cut(Zapato, breaks = c(34, 38, 42, 48), include.lowest = T)
Histograma (freq=FALSE => histograma con area 1):   hist(Altura, freq = FALSE, breaks = seq(140, 200, by = 10))
Boxplot: boxplot(Altura~Sexo)


Tabla con las frecuencias:   table(clase$Equipo)
Total:  n <- sum(fabs_equipo)
Media:  mean(x)
Mediana: median(Altura)
Moda:  which(fabs_equipo==max(fabs_equipo))
Max y min: range(Altura)
Rango: diff(range(Altura))
Cuantiles:   quantile(Altura,0.5)
Intercuartílico:   IQR(Altura)
Varianza (Como en clase, forma n):   sum((Altura-mean(Altura))ˆ2)/n
Varianza (Forma n-1): var(Altura)
Desv. Típica (Forma n-1):  sd(Altura)

PARA OBVIAR DATOS SIN CONTESTAR:  na.rm=TRUE

GUION 3

CATEGÓRICA-CATEGÓRICA

Tabla de contingencia: table(Grupo, Equipo)
Partir los datos:  cut(clase$Zapato,breaks=c(35,38,43,48),include.lowest=TRUE)
Gráfica de barras (beside=F => barras apiladas):  barplot(tabla_grupo_zapato, legend=c("Grupo A","Grupo B"), beside= T)
Chi cuadrado:   ni.=apply(nij,1,sum);  n.j=apply(nij,2,sum);   n=sum(ni.);   Eij=outer(ni.,n.j)/n
		    chi2=sum((nij-Eij)^2/Eij)

CONTINUA-CATEGÓRICA

Apply pero respetando la var. Categórica:   tapply(Altura, Grupo, quantile, c(0.2, 0.4))
Tapply pero para todo un data frame: by(clase, Grupo, summary)
Boxplot, ya vista

CONTINUA-CONTINUA

Representación (Algunos argumentos más en ?plot):    plot(x,y,pch=19, ylab="Peso",xlab="Altura", main="Dispersión Altura-Peso", col=4)
Argumento type="" de plot(): "p"->punto  "l"->linea  "b"->ambos  "n"->nada ...
Leyenda:   legend("bottomleft",col=1:2,lty=1,c("Seno","Coseno"))
Recta de regresión (cov() tiene la forma n-1): b=cov(x,y)/var(x);   a=mean(y)-b*mean(x);   abline(a,b)
Puntos: points()
Lineas: lines()
Texto: text()

GUION 5

Definir vectores:   v<-numeric()
Simulación:   sample(1:6, size = 4, replace = TRUE, prob = c(0.5, 0.5))   o   sample(c("C", "+"), 5, replace = TRUE, prob = c(0.5, 0.5))
Bucle:  for (i in "vector") { sentencias[i] }
Condiciones:   if (cond1) {sentencias1} else if (condicion2) {sentencias2} [...] else {sentenciasN}
Funciones:   nombre <-function(x, y, a=FALSE) { b<-cálculos ; return(b) }
Para funciones con var por defecto poner un argumento lógico y un if(arg=T) {tarea} ...

GUION 6

Factorial: factorial(pi)
Combinatorio: choose(n,k)

d  Función de masa
p  Probabilidad acumulada
q  Cuantiles
r  Aleatorio

binom   Binomial
geom    Geométrica
pois    Poisson
nbinom  Binomila negativa


Algunas combinaciones de lo anterior:

dbinom(k,size=n,prob=p)
pbinom(k,size=n,prob=p)
qbinom(cuantil,size,prob)
rbinom(repeticiones,size,prob)

geom es lo mismo que binom pero sin "size"
pois es lo mismo que geom pero con "lambda" y no "prob"

