# MadMiner on REANA

The workflow version of Madminer aims to provide a complete example of how Madminer can be used on highly scalable experiments to (1) generate collision events, and (2) perform Machine Learning inference on that data.

The workflow contains all the necessary elements to be run both locally (making use of [Yadage](https://yadage.readthedocs.io/en/latest/)) and remotely (making use of [REANA](https://reanahub.io/)). It also integrates with a metrics tracking system called [MLFlow](https://mlflow.org/), that can, optionally, save certain Machine Learning metrics from run to run.

## Workflow repositories
The workflow is currently split into 3 different GitHub repositories:

  * [Scailfin/madminer-workflow-ph](https://github.com/scailfin/madminer-workflow-ph): containing the event generation part.
  * [Scailfin/madminer-workflow-ml](https://github.com/scailfin/madminer-workflow-ml): containing the inference part.
  * [Scailfin/madminer-workflow](https://github.com/scailfin/madminer-workflow): wrapping both parts to construct the complete workflow.

The distribution of the workflow into 2 separate sub-workflows (PH and ML) with a wrapper around them, allow us to make both of those sub-workflow **locally** executable on their own. This way, researchers have the option to **locally** run a particular part of the complete workflow multiple times, and with different parameters, without having to deal with the uninterested part.

## Technologies
Before jumping the different commands to interactuate with the workflow, some words about the technologies the workflow relies on:

 * **Docker**: used to encapsulate and isolate the dependencies and the small snippets of code that the workflow steps use to interact with Madminer (installed as one of the dependencies).*

 * **Yadage**: a command line interface (CLI) tool that coordinates the execution of computational workflows locally. It also defines its own workflow specification language, which is the one in which the workflow itself is defined.

 * **REANA**: a cloud-based platform that coordinates the execution of computational workflows remotely. It can be used to scale up the workflow execution increasing the values of the default parameters. It can be [installed locally](https://docs.reana.io/administration/deployment/deploying-locally/), although it requires some experience.

 * **MLFlow**: external component used to store and track certain metrics of the Machine Learning part of the workflow, thanks to the use of its tracking-UI part. It is not part of the Madminer-workflow itself and its usage is optional.

*Note*: The Docker images used within the workflow have been already built and pushed to the [Madminertool DockerHub account](https://hub.docker.com/u/madminertool).Those images are of general purpose, and their maintenance / evolution remains a responsibility of the madminer-workflow developers, not the users.

## The workflow

Below is an image of a full MadMiner workflow (the largest blue box), which includes the two subworkflows. The first blue boxes labeled `workflow_ph[0]` is responsible for event generation with MadGraph and simulation with Delphes running at multiple EFT parameter points, followed by a combine step that produces a single large data file. The `workflow_ml[0]` is responsible the ML portions, and it starts with a sampling the combined data file for training data, three training runs, evaluation of each of the three models, and then a plotting stage.

![image of the workflow](../images/workflow-all.png)