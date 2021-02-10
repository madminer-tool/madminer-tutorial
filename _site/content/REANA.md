# MadMiner on REANA

The workflow version of Madminer aims to provide a complete example of how Madminer can be used on highly scalable experiments to (1) generate collision events, and (2) perform Machine Learning inference on that data.

The workflow contains all the necessary elements to be run both locally (making use of Yadage) and remotely (making use of REANA). It also integrates with a metrics tracking system called MLFlow, that can, optionally, save certain Machine Learning metrics from run to run.

## Workflow location
The workflow is currently split into 3 different GitHub repositories:

  * Scailfin/madminer-workflow-ph: containing the event generation part.
  * Scailfin/madminer-workflow-ml: containing the inference part.
  * Scailfin/madminer-workflow: wrapping both parts to construct the complete workflow.

The distribution of the workflow into 2 separate sub-workflows (PH and ML) with a wrapper around them, allow us to make both of those sub-workflow **locally** executable on their own. This way, researchers have the option to **locally** run a particular part of the complete workflow multiple times, and with different parameters, without having to deal with the uninterested part.

## Technologies
Before jumping the different commands to interactuate with the workflow, some words about the technologies the workflow relies on:

 * **Docker**: used to encapsulate and isolate the dependencies and the small snippets of code that the workflow steps use to interact with Madminer (installed as one of the dependencies).*

 * **Yadage**: a command line interface (CLI) tool that coordinates the execution of computational workflows locally. It also defines its own workflow specification language, which is the one in which the workflow itself is defined.

 * **REANA**: a cloud-based platform that coordinates the execution of computational workflows remotely. It can be used to scale up the workflow execution increasing the values of the default parameters. It can be installed locally, although it requires some experience.

 * **MLFlow**: external component used to store and track certain metrics of the Machine Learning part of the workflow, thanks to the use of its tracking-UI part. It is not part of the Madminer-workflow itself and its usage is optional.

*Note*: The Docker images used within the workflow have been already built and pushed to the Madminertool DockerHub account.Those images are of general purpose, and their maintenance / evolution remains a responsibility of the madminer-workflow developers, not the users.

## Workflow setup

In order to setup the workflow locally, you can just clone the madminer-workflow repository,  as long as the two wrapped sub-workflows by running:

```bash
git clone --recurse-submodules https://github.com/scailfin/madminer-workflow
```

This command will also clone the PH and ML sub-workflows inside the modules folder. You can also install them separately (if you want to interact with them in a separate manner), by running:

```bash
git clone https://github.com/scailfin/madminer-workflow-ml
git clone https://github.com/scailfin/madminer-workflow-ph
```

Then, depending whether you want to run the workflow locally, or remotely, both Yadage and the reana-client CLI would need to be installed:

```bash
pip3 install yadage
pip3 install reana-client
```

The official documentation, and the README files of these repositories recommend creating a Python virtual environment to install these packages. However, if your interaction with the project is going to be from a user perspective, this is not mandatory.

Finally, you would need to have Docker installed, as it will be used as the DockerHub image-pulling mechanism. Please follow the instructions on the Docker installation guide.