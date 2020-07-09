#!/bin/bash

# Sample Slurm job script
#   for TACC Longhorn Nodes
#
#------------------------------------------------------------------------------

#SBATCH -J imgkfc16                 # Job name
#SBATCH -o imgnet_kfc16.o%j # Name of stdout output file
#SBATCH -N 16                       # Total # of nodes 
#SBATCH -n 64                       # Total # of mpi tasks
#SBATCH -t 12:00:00                # Run time (hh:mm:ss)
#SBATCH --mail-user=tg824074
#SBATCH --mail-type=end            # Send email at begin and end of job
#SBATCH -p v100
#SBATCH -A Deep-Learning-at-Sca    # Allocation

module load conda
conda activate pytorch-test

scontrol show hostname > hostfile

mpiexec -hostfile hostfile -N 1 cp_imagenet_to_temp.sh

mpiexec -hostfile hostfile -N 4 killall -9 python

mpiexec -hostfile hostfile -N 4 python examples/pytorch_imagenet_resnet.py --model resnet50 --kfac-update-freq 0 --epochs 90 --base-lr 0.0125 --warmup-epochs 5 --batch-size 16 --train-dir=/tmp/test/ILSVRC2012_img_train/ --val-dir=/tmp/test/ILSVRC2012_img_val/

# -----------------------------------------------------------------------------
