#!/bin/bash
#SBATCH --partition=largemem
#SBATCH --account=weisenbe_1344
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --cpus-per-task=4
#SBATCH --mem=128G
#SBATCH --time=48:00:00

module purge
module load gcc/11.3.0
module load python/3.9.12
module load jdk
module load nextflow
module load conda

nextflow run nf-core/rnaseq \
    --input /project/weisenbe_1344/Complete_David_870_Project_Directory_Transfer/Projects/RNA-seq/Mancuso_20240814/samplesheet.csv \
    --outdir /project/weisenbe_1344/Complete_David_870_Project_Directory_Transfer/Projects/RNA-seq/Mancuso_20240814/run1 \
    --gtf /project/weisenbe_1344/Complete_David_870_Project_Directory_Transfer/Resources/spatial/refdata-gex-GRCh38-2020-A/genes/genes.gtf \
    --fasta /project/weisenbe_1344/Complete_David_870_Project_Directory_Transfer/Resources/spatial/refdata-gex-GRCh38-2020-A/fasta/genome.fa \
    --igenomes_ignore \
    --genome null \
    --skip_trimming \
    --trimmer fastp \
    -profile slurm,conda \
    --save_align_intermeds \
