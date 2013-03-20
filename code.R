##Generate simple data, regression with 12 regressors
##Only first regressor matters.
##Pass the coefficients as a parameters
gensimple <- function(n,cf) {
    x1 <- matrix(rnorm(1*n),ncol=1)
    x2 <- matrix(rnorm(11*n),ncol=11)
    y<-cf[1]+x1*cf[2]+rnorm(n)
    list(y=y,x1=cbind(1,x1),x2=x2)
}

##Do the F-test on the significance of additional regressors in x2
f.test <- function(y,x1,x2) {
    if(!is.matrix(x1))x1 <- matrix(x1,ncol=1)
    if(!is.matrix(x2))x2 <- matrix(x2,ncol=1)
    mu1 <- lsfit(x1,y,intercept=FALSE)
    mu2 <- lsfit(cbind(x1,x2),y,intercept=FALSE)
    RSS1 <- sum(residuals(mu1)^2)
    RSS2 <- sum(residuals(mu2)^2)
    n <- length(y)
    (RSS1-RSS2)/RSS2*(n-ncol(x1)-ncol(x2))
}

##Do N simulations with sample size n and given coefficients cf.
testf <- function(N,n,cf) {
    foreach(i=1:N,.combine=c) %do% {
        aa <- gensimple(n,cf)
        f.test(aa$y,aa$x1,aa$x2)
    }
}
