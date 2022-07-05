#!/bin/bash

###Performing modified basecalling using Guppy basecalling software developed by Oxford Nanopore Technologies

##Created by Sanaz Agarwal
##25 April 2022
##Email: sanaz.iitd@gmail.com

##Version: Guppy - ________ (GPU based)

config_file=$1          ##onfiguration file used. See list of configuration files available as 'ls /ont-guppy/data/*.cfg'
fast5_dir=$2          ##directory containing fast5 files generated from Nanopore Sequencing, fast5 files will be taken recursively within this directory
save_dir=$3           ##output directory for saving fastq files   


##GPU enabled basecalling command. Using V100 Tesla GPU.
guppy_basecaller -c ${config_file} -i ${fast5_dir} -s ${save_dir} --recursive\
				 --num_callers 8 --gpu_runners_per_device 6 --chunks_per_runner 512 --chunk_size 3000 --chunks_per_caller 10000 --device cuda:0:50%      #enhance computation power                                                        

#Optional parameters: --compress_fastq: .gz compress the fastq files generated 
#					  --fast5_out     : allow generation of fast5 files with additional data stored
#					  --align_ref     : provide refernce genome for internal aligment with generated fastq reads
#					  --bam_out       : output bam alignment files in case aligment option is enabled

