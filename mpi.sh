#!/bin/sh
#SBATCH -p short
#SBATCH -n7

##Change zemlys to your user name. Set the HOME as explained here
##http://mif.vu.lt/cluster/?r.html

##Set the path where R looks for libraries
R_LIBS=/scratch/lustre/zemlys/lib64/R/library
export R_LIBS

##Create 6 workers. Note we need n+1 servers, n workers and one control
##Use full paths. If you dare, try out the relative ones
mpirun -H localhost,n1,n2,n3,n4,n5,n6 -n 1 /scratch/lustre/zemlys/bin/R --vanilla --slave -f /scratch/lustre/zemlys/R/mifcluster/simulate.R
