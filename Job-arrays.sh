:'SLURM allows you to submit a number of identical jobs simultaneously convenient way to submit a large number of independent processing jobs
in the form of a job array. To take advantage of this, you will need a set of jobs that differ only by an "index" of some kind.
For example, say that you would like to run tophat,a splice-aware transcript-to-genome mapping tool, on 30 separate transcript files named trans1.fq, trans2.fq, trans3.fq, etc.
First, construct a SLURM batch script, called tophat.sh, using special SLURM job array variables:'

#####################################################################
#!/bin/bash
#SBATCH -J tophat # A single job name for the array
#SBATCH -n 1 # Number of cores
#SBATCH -N 1 # All cores on one machine
#SBATCH -p serial_requeue # Partition
#SBATCH --mem 4000 # Memory request (4Gb)
#SBATCH -t 0-2:00 # Maximum execution time (D-HH:MM)
#SBATCH -o tophat_%A_%a.out # Standard output
#SBATCH -e tophat_%A_%a.err # Standard error

module load tophat/2.0.13-fasrc02

tophat /n/regal/informatics_public/ref/ucsc/Mus_musculus/mm10/chromFatrans"${SLURM_ARRAY_TASK_ID}".fq

#####################################################################
