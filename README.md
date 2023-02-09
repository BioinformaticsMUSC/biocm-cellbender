# biocm-cellbender docker container

This is a dockerfile for a container to be used via Sigularity on the 
Palmetto cluster. The container is set up with CUDA-enabled Pytorch and 
can be used to run CellBender.

## Example usage

This container can be used interactively or with a batch job submission. For cellbender, a batch job submission is ideal.


### Batch job use

For a batch job, remember to select a node with gpu access (musc3_gpu). In the PBS file, use the following code:
```
cd /zfs/musc3/singularity_images

singularity exec --nv -B /scratch1/bryangranger/cecile:/mnt --pwd /mnt biocm-cellbender_latest.sif cellbender remove-background \
--input {input file} \
--output {output file} \
--expected-cells 15000 \
--fpr 0.01 \
--epochs 150 \
--cuda
```
Note the following options:
-`--nv`: this is required to enable CUDA within the container
-`-B /zfs/musc3:/mnt`: this command creates a link between the source directory (here, `/zfs/musc3`) and the destination directory inside the container `/mnt`. You may link any source directory--those directories and files will then be accessible inside the container. If you save anything within those directories inside the container, it will exist when the container is done. 
-`--pwd /mnt`: this sets the working directory inside the container to `/mnt`, which is the mounted volume linked to the source directory.

### Interactive use

Navigate to the `singularity_images` folder:
```
cd /zfs/musc3/singularity_images
```

Use the following command to open a shell command prompt:

```
singularity shell --nv -B /zfs/musc3:/mnt --pwd /mnt biocm-cellbender_latest.sif
```

Note the same options as above.

Once inside the container, you can run cellbender as usual:
```
cellbender remove-background \
--input {input file} \
--output {output file} \
--expected-cells 15000 \
--fpr 0.01 \
--epochs 150 \
--cuda
```
