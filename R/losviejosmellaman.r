data <- read.csv2("vjuegos.csv", encoding = "latin1")
data2 <- read.csv2("spotify.csv")
data3 <- read.csv2("redes.csv")

data[data$genero == "Platform", ]
ventas <- cut(data$ventasUSA, c(seq(1, 42, 5), 42),
              include.lowest = TRUE)
table(ventas, data$genero)

# EXAMEN CHATO GPT

sp <- read.csv2("spotify.csv")
sort(tapply(sp$popularidad, sp$artista, mean))
tapply(sp$energia, sp$genero, mean)
duracion <- sp$duracion[sp$modo == 0]
hist(duracion, col = rainbow(5))
plot(sp$energia, sp$duracion, main = "Eugenio Pepe",
     xlab = "Flow yo que sé mmm",
     ylab = "QUIETOOOOOS cojonudo (Alejandro)")

beta1 <- cov(sp$energia, sp$duracion) / var(sp$energia)
beta0 <- mean(sp$duracion) - beta1 * mean(sp$energia)
abline(b = beta1, a = beta0)

rd <- read.csv2("redes.csv")
tabla <- table(rd$plataforma[rd$tiempo > 100])
tabla <- tabla / sum(tabla)
mean(rd$tiempo[rd$plataforma == "Instagram"])

vj <- read.csv2("redes.csv")
s <- 0
for (i in 1:100000) {
    x <- sample(1:10, size = 1)
    if (x == 7) {
       s <- s + 90
    } else {
        s <- s - 10
    }
}

print(s / 100000)

chi2 <- function(nij) {
    n <- sum(nij)
    ni <- apply(nij, 1, sum)
    nj <- apply(nij, 2, sum)
    
    eij <- outer(ni, nj) / n
    chi2 <- sum((nij - eij) ** 2 / eij)

    return(chi2)
}
