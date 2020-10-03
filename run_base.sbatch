#!/bin/bash
####
#a) Define slurm job parameters
####

#SBATCH --job-name=baseline

#resources:

#SBATCH --cpus-per-task=4
# the job can use and see 4 CPUs (from max 24).

#SBATCH --partition=day
# the slurm partition the job is queued to.

#SBATCH --mem-per-cpu=15G
# the job will need 12GB of memory equally distributed on 4 cpus.  (251GB are available in total on one node)

#SBATCH --gres=gpu:4
#the job can use and see 1 GPUs (4 GPUs are available in total on one node)

#SBATCH --time=23:59:00
# the maximum time the scripts needs to run
# "minutes:seconds", "hours:minutes:seconds", "days-hours", "days-hours:minutes" and "days-hours:minutes:seconds"

#SBATCH --error=job.%J.err
# write the error output to job.*jobID*.err

#SBATCH --output=job.%J.out
# write the standard output to job.*jobID*.out

#SBATCH --mail-type=ALL
#write a mail if a job begins, ends, fails, gets requested or stages out

#SBATCH --mail-user=leena.bitspilani@gmail.com
# your mail address

####
#b) copy all needed data to the jobs scratch folder
####

# cp -R /common/datasets/MNIST/ /scratch/$SLURM_JOB_ID/

####
#c) Execute your tensorflow code in a specific singularity container
#d) Write your checkpoints to your home directory, so that you still have them if your job fails

####
nvidia-smi -l 5 > nvidia.txt &
python stylegan2_pytorch/cli.py
echo DONE!
