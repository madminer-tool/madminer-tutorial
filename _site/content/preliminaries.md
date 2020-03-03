

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

In addition, the pages with code have an "Interactive" button at the top, and if you click them you should be able to run the notebooks in the cloud (intead of on your laptop) thanks to [Binder](https://mybinder.org). However, the working area is temporary and it won't save your files once the session ends. 

## Install Docker

[Download Docker Desktop](https://www.docker.com/products/docker-desktop)

The link above should work for Mac OS X or Windows, but it requires Windows 10 Professional or Enterprise 64-bit. For previous versions of Windows (or Windows Home 10) use [Docker Toolbox](https://docs.docker.com/toolbox/overview/): use [these instructions](https://docs.docker.com/toolbox/toolbox_install_windows/). Note there are some other small changes listed at the bottom of this page. 

You may want to go into docker preferences and adjust the resources given to the docker engine. In particular memory and swap space since this will involve machine learning. 

## Make a directory to share between your laptop and the container

Make a directory 
```bash
mkdir ~/madminer_shared
```

(You can put it somewhere else if you want, but I'll assume it's there)

## Get tutorial & start Jupyter in container

Enter an interactive session in the MadMiner docker container.
The first time you execute this it will need to pull the container, which will take about a minute.
```bash
docker run -p 8888:8888 -v ~/madminer_shared:/home/shared -it madminertool/docker-madminer-all /bin/bash
```
(If you are using Docker Toolbox on windows, see section below.)

Now you have a prompt inside the container. See what's there and then go into the `shared` directory

```bash
pwd
ls
cd shared
echo 'hello world' >> test.txt
```

Now you might want to check that on your computer you see `~/madminer_shared/test.txt`

<!--
Upgrade MadMiner with pip
```bash
pip install --upgrade madminer
```
-->

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

Now you should be able to connect to the Jupyter notebook server inside the container using your normal browser. Click this link (open in a new tab): [localhost:8888](localhost:8888). (If you are using Docker Toolbox on windows, see section below.) You should see a Jupyter terminal and it will ask for a login token. Paste the token (in this example, `123copywhatyouseeherexyz`) and login.

Now you should be all set and see something like this.

![](/madminer-tutorial/images/notebook.png)

## Updating the docker image

While developig and testing this tutorial we may occasionally update the docker image. If you completed the preliminaries some time ago, you might want to update with:
```shell
docker pull madminertool/docker-madminer-all
```
This will replace all the contents of the docker image, but not the files in the shared directory. YOu will still want to re-do the 
steps described above in **Get tutorial & start Jupyter in container**.

## Special instructions for Docker Toolbox Windows 

Thanks to Ioannis Karkanias for these notes on Docker Toolbox

1) The 
```docker run -p 8888:8888 -v ~/madminer_shared:/home/shared -it madminertool/docker-madminer-all /bin/bash``` 
command's -v argument needs to be something like this

```shell
-v /c/Users/kark/madminer_shared:/home/shared
```
(replace `kark` is your username). The shared folder needs to be in the `Users/` directory, as the Docker Toolbox uses VirtualBox and the shared folder specified for the machine that is created in VirtualBox only has `C:/Users/` as a shared folder. There are instructions [here](https://docs.docker.com/toolbox/toolbox_install_windows/#optional-add-shared-directories)

2) Since Docker-Toolbox uses a virtual machine and there is no `localhost`, the 
"Click this link (open in a new tab): `localhost:8888`." 
part of the instructions needs to change to the default IP used by the Docker Toolbox's virtual machine, which you can find in the [Docker Toolbox command line interface](https://docs.docker.com/toolbox/toolbox_install_windows/#step-3-verify-your-installation) by typing the command:

```shell
docker-machine ip default
```
which should return something like:
```
docker is configured to use the default machine with IP 192.XXX.YY.ZZZ
```
and then you can access the created Jupyter notebook by pointing your browser to: ```<result of the docker-machine ip default command>:8888```



