add2 <- function(x, y){
        x + y
}

above10 <- function(x) {
        use <- x > 10
        x[use]
}

above <- function(x, n = 10) {
        use <- x > n
        x[use]
}

columnmean <- function(y, removeNA = TRUE){
        nc <- ncol(y) ##tæller antallet af kolonner
        means <- numeric(nc) ##vector der skal indeholde mean for hver kolonne
        for(i in 1:nc){
                means[i] <- mean(y[, i], na.rm = removeNA)
        }
        means
}

f <- function(a, b){
        print(a)
        print(b)
}
f(45)

make.power <- function(n) {
        pow <- function(x) {
                x^n
        }
        pow
}

f <- function(x) {
        y <- 2
        y^2 + g(x)
}

g <- function(x) {
        x*y
}

f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}