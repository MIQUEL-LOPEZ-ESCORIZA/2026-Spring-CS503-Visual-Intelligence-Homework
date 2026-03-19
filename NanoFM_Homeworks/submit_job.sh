#!/bin/bash
#SBATCH --job-name=you_job         # Change as needed
#SBATCH --time=02:00:00
#SBATCH --account=cs-503
#SBATCH --qos=cs-503
#SBATCH --gres=gpu:2                    # Request 2 GPUs
#SBATCH --mem=64G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4               # Adjust CPU allocation if needed
#SBATCH --output=interactive_job.out    # Output log file
#SBATCH --error=interactive_job.err     # Error log file

CONFIG_FILE=$1
WANDB=$2
NUM_GPUS=$3

source ~/miniconda3/etc/profile.d/conda.sh
conda activate nanofm
export WANDB_API_KEY=$WANDB && OMP_NUM_THREADS=1 torchrun --nproc_per_node=2 run_training.py --config /home/milopez/me/2026-Spring-CS503-Visual-Intelligence-Homework/NanoFM_Homeworks/cfgs/nanoMaskGIT/tinystories_d8w512.yaml

