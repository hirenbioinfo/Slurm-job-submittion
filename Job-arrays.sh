:'SLURM allows you to submit a number of identical jobs simultaneously convenient way to submit a large number of independent processing jobs
in the form of a job array. To take advantage of this, you will need a set of jobs that differ only by an "index" of some kind.
For example, say that you would like to run tophat,a splice-aware transcript-to-genome mapping tool, on 30 separate test1.fq, test2.fq,....so on.
First, construct a SLURM batch script, called tophat.sh, using special SLURM job array variables:'

#####################################################################
#!/bin/bash
#SBATCH -J <name of your job> # A single job name for the array
#SBATCH -n <1> # Number of cores
#SBATCH -N <1> # All cores on one machine
#SBATCH -p serial_requeue # Partition
#SBATCH --mem <4000> # Memory request (4Gb)
#SBATCH -t 0-2:00 # Maximum execution time (D-HH:MM)
#SBATCH -o tophat_%A_%a.out # Standard output
#SBATCH -e tophat_%A_%a.err # Standard error

<your code and modele start here>

#####################################################################

:'sbatch --array=1-10 script.sh
A job array with array tasks numbered from 0 to 10.
SBATCH --array=0-31
A job array with array tasks numbered 1, 2, 5.
SBATCH --array=1,2,5
A job array with array tasks numbered 1, 3, 5 and 7.
SBATCH --array=1-7:2 '
