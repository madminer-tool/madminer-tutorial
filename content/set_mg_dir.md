# Set the MadGraph Directoryt


The tutorials should run as is with one exception: you need to set the location of MadGraph in the container.

In part `2a_parton_level` and/or `2b_delphes_level_analysis` in Cell 3, you need to change

```
mg_dir = '/Users/johannbrehmer/work/projects/madminer/MG5_aMC_v2_6_5’
```
to

```shell
mg_dir = 'mg_dir = '/home/software/MG5_aMC_v2_6_2'
```

which is where MadGraph is located in this container.

