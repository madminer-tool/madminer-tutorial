

# Preliminaries

The tutorial has several software dependencies 

 * MadGraph (including Fortran)
 * pythia
 * Delphes (optional)
 * pytorch
 * Jupyter
 * scipy 
 * MadMiner

Installing all of this can take a long time. To avoid that, we will use [Docker](https://www.docker.com). 
Irina Espejo has built Docker containers with everything installed already and pushed them to [DockerHub under madminertool](https://hub.docker.com/u/madminertool/).

We will still use our computer's normal browser to connect to the server as described in this tutorial: [Running a Dockerized Jupyter Server for Data Science](https://www.dataquest.io/blog/docker-data-science/).

The process is fairly painless and will also work on Mac and Windows . Follow the steps below. 

## Install Docker

[Download Docker Desktop](https://www.docker.com/products/docker-desktop)

## Get tutorial & start Jupyter in container

Enter an interactive session in the MadMiner docker container.
The first time you execute this it will need to pull the container, which will take about a minute.
```bash
docker run -p 8888:8888 -it madminertool/docker-madminer-physics /bin/bash
```

Now you have a prompt inside the container.

Get the MadMiner repository with tutorial notebooks
```bash
git clone https://github.com/diana-hep/madminer.git
```

Now move to the directory with the example tutorial
```bash
cd madminer/examples/tutorial_particle_physics
```

Start Jupyter inside the container
```bash
jupyter notebook --ip 0.0.0.0 --port 8888 --allow-root
```

You should see something like this:
```shell
   To access the notebook, open this file in a browser:
        file:///home/builder/.local/share/jupyter/runtime/nbserver-19-open.html
    Or copy and paste one of these URLs:
        http://(b27060a7c9a2 or 127.0.0.1):8888/?token=123copywhatyouseeherexyz
```

will want to copy the text after the token (in your terminal, this is just an example). In this case you would copy the `123copywhatyouseeherexyz`

Now you should be able to connect to the Jupyter notebook server inside the container using your normal browser. Click this link (open in a new tab): [localhost:8888](localhost:8888). You should see a Jupyter terminal and it will ask for a login token. Paste the token (in this example, `123copywhatyouseeherexyz`) and login.

Now you shouuld be all set and see something like this.


## The rest of the tutorials should run as is with these exceptions

In part `2a_parton_level` in Cell 3, you need to change

```bash
mg_dir = '/Users/johannbrehmer/work/projects/madminer/MG5_aMC_v2_6_5’
```
to
```bash
mg_dir = 'mg_dir = '/home/software/MG5_aMC_v2_6_2'
```

which is where madgraph is located in this container.

