##Set the library path of your R packages
.libPaths("/scratch/lustre/zemlys/lib64/R/library")

##Load the preliminaries. 
source("prelim.R")

library(snow)
library(Rmpi)

print(sessionInfo())
cl<-makeMPIcluster(mpi.universe.size()-1)

ignore <- clusterEvalQ(cl, {
source("prelim.R")
NULL
}
)

HHH<-list(h01,h02,h03,h04,h05,h06)

oneh<-function(hh) {
    ii<-lapply(c(25,50,100,500,1000),function(n)testf(10,n,hh))
    ii
}

##test it on your own computer
##rr1<-lapply(HHH,oneh)

##Run it on cluster. Note that HHH length is the same as the number of
##workers, which we set in mpi.sh file.
##In case of 6 workers your calculations will run 6 times faster than
##on your computer. 
tm<-snow.time(rr1<-clusterApply(cl,HHH,oneh))

save(rr1,tm,file="res.RData")

##Very important to quit gracefully
stopCluster(cl)
mpi.quit()

##See the calculation time on your computer
##plot(tm)
