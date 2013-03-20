mifcluster
==========

Example of running embarassingly parallel computations on VU MIF cluster

You need to be familiar with R, ssh, git and command line. Tough luck. If you are not familiar with them, 
then you are not worthy to use the cluster.

First connect to MIF

    ssh username@uosis.mif.vu.lt

Then do the magic required to connect to cluster

    kinit
    ssh cluster

Create your place on cluster

    mkdir -p /scratch/luster/username
    
Set it to $HOME

    cd /scratch/lustre/username
    setenv HOME /scratch/lustre/username ##One of the following should work
    export HOME=/scratch/lustre/username 

Create a directory for your R projects:

    cd ~
    mkdir R

Get this code

    cd r
    git clone git@github.com:mpiktas/mifcluster.git
    cd mifcluster
    
Run the calculations

    sbatch mpi.sh
    
Look out for files of type ```slurm-12043.out``` in your directory. They contain the status of your simulations. Check for error messages there
  
To navigate use ```cd```, to see content of the directory use ```ls```, for editing use ```nano``` or ```vim```.

To make the file exchange between cluster and your computer, consider becoming a http://github.com user. Create repository and then push and pull from server and your computer.

Consider installing ```screen``` and ```zsh``` to make the life a bit easier.

