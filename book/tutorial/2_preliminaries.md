# Preliminaries

The tutorial has several software dependencies:
- MadGraph.
- Pythia.
- Delphes (optional).
- Pytorch.
- Jupyter.
- Scipy.
- MadMiner.

Installing all of this can take a long time. To avoid that, we will use [Docker][docker-web].
Sinclert Pérez and Irina Espejo have built Docker images with every dependency installed,
making them available on the [Madminertool][dockerhub-madminer] DockerHub organization.

We will still use our computer's web browser to connect to the server as described in this tutorial:
[Running a Dockerized Jupyter Server for Data Science][jupyter-server-tutorial].

In addition, the pages with code have an "Interactive" button at the top, and if you click them
you should be able to run the notebooks in the cloud (instead of on your laptop) thanks to [Binder][binder-web].
However, the working area provided by Binder is temporary, and it will not save your files once the session ends.


## Install Docker
To install Docker, go to the [Download Docker Desktop][docker-download] page. The installation should work
for macOS and Windows, but in the case of Windows, it requires Windows 10 Professional or Enterprise 64-bit.
For old versions of Windows (or Windows Home) use [Docker Toolbox][docker-toolbox] (see [instructions][docker-toolbox-guide]).
Note there are some other small changes listed at the bottom of this page.

You may want to go into docker preferences and adjust the resources given to the Docker engine.
In particular memory and swap space since this will involve machine learning.


## Make a shared directory
Make a shared directory between your laptop and the Docker container:

```bash
mkdir ~/madminer_shared
```


## Start Jupyter server in a container
In order to start an interaction session from a Docker container, we will spin up the MadMiner Docker image.
The first time we spin it up, the image needs to be pulled from DockerHub, which will take about a minute.

```bash
docker run --rm \
    -p 8888:8888 \
    -v ~/madminer_shared:/home/shared \
    -it madminertool/madminer-jupyter-env \
    /bin/bash
```

(If you are using Docker Toolbox on Windows, see section below).

Now you have a prompt inside the container. See what's there and then go into the `shared` directory

```bash
cd /home/shared
echo 'hello world' >> test.txt
```

You might want to check that on your computer you see the recently created `~/madminer_shared/test.txt` file. Then:

Get the MadMiner repository with tutorial notebooks:
```bash
git clone --depth=1 https://github.com/diana-hep/madminer.git
```

Move to the directory with the example tutorial:
```bash
cd madminer/examples/tutorial_particle_physics
```

Start Jupyter inside the container:
```bash
jupyter notebook --ip 0.0.0.0 --port 8888 --allow-root
```

At the end of the process, you should see something like this:
```bash
    To access the notebook, open this file in a browser:
        file:///home/builder/.local/share/jupyter/runtime/nbserver-19-open.html
    Or copy and paste one of these URLs:
        http://(b27060a7c9a2 or 127.0.0.1):8888/?token=123copywhatyouseeherexyz
```

You will want to copy the text after the token (in your terminal, this is just an example).
In the example above, you would copy `123copywhatyouseeherexyz`.

Now you should be able to connect to the Jupyter notebook server inside the container using your web browser.
Go to [`localhost:8888`][jupyter-server-localhost] in a new tab to see the Jupyter interface. At this stage,
paste the token you just copied and log in. Then you will be all set, and will see something like this:

![Jupyter login page][jupyter-login-image]


## Update the Docker image
While developing and testing this tutorial we may occasionally update the Docker image.
If you completed the preliminaries some time ago, you might want to get the most updated image by doing:

```bash
docker pull madminertool/madminer-jupyter-env
```

This will replace all the internal contents of the Docker image, but not the files in the shared directory.
You will still want to re-do the steps described above in the **Start Jupyter server in a container** section.


## Special instructions: Docker Toolbox for Windows
Thanks to Ioannis Karkanias, there is a way to run the Jupyter server using Docker Toolbox

1) First, the shared folder needs to be in the `Users` directory, as Docker Toolbox uses VirtualBox,
   which uses `C:/Users` as the root path for all shared folders. Check the Docker Toolbox sharing
   folder [instructions][docker-toolbox-sharing].

    ```bash
    docker run --rm \
        -p 8888:8888 \
        -v /C/Users/<USERNAME>/madminer_shared:/home/shared \
        -it madminertool/madminer-jupyter-env \
        /bin/bash
    ```

2) Since Docker Toolbox uses a virtual machine and there is no `localhost`, the URL used to reach
   the Jupyter log in interface will not be `localhost:8888`. To check the public IP where you can reach
   the login page, we can use the Docker CLI, as described in [this guide][docker-toolbox-verify].

    ```bash
    docker-machine ip default
    ```

    That command will expose the public IP to use, which must be followed by the Jupyter server default port (`:8888`)
    to build the complete URL needed to access the web interface.


[binder-web]: https://mybinder.org
[docker-download]: https://www.docker.com/products/docker-desktop
[docker-toolbox]: https://docs.docker.com/toolbox/overview
[docker-toolbox-guide]: https://docs.docker.com/toolbox/toolbox_install_windows
[docker-toolbox-sharing]: https://docs.docker.com/toolbox/toolbox_install_windows/#optional-add-shared-directories
[docker-toolbox-verify]: https://docs.docker.com/toolbox/toolbox_install_windows/#step-3-verify-your-installation
[docker-web]: https://www.docker.com
[dockerhub-madminer]: https://hub.docker.com/u/madminertool
[jupyter-login-image]: images/notebook.png
[jupyter-server-tutorial]: https://www.dataquest.io/blog/docker-data-science
[jupyter-server-localhost]: localhost:8888
