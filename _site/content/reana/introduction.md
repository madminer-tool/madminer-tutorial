
Thus far, the tutorial describes running the various steps on your local computer. In the interest of time, we did not generate much training data. For serious research we will need to generate more data for training and evaluation. For this, you will probably want to run these jobs on a cluster. You may also want compare various methods or tune the hyperparameters for the machine learning models and training steps. Furthermore, the MadMiner tutorial involves several steps (event generation, detector simulation, training the machine learning models, evaluating the trained models, and the final analysis and plotting stages). To streamline this, we’ve integrated MadMiner into the [REANA](https://reanahub.io/)) workflow execution system and defined a workflow using the yadage workflow language. 

Integrating MadMiner into the REANA workflow system allows us to scale the tutorial to large numbers of events and large parameter scans. This work was supported by the [SCAILFIN](https://scailfin.github.io) (Scalable CyberInfrastructure for Artificial Intelligence and Likelihood Free Inference) Project and [IRIS-HEP](https://iris-hep.org).

The workflow contains all the necessary elements to be run both locally (requiring only the [Yadage](https://yadage.readthedocs.io/en/latest/) workflow engine) and remotely (making use of [REANA](https://reanahub.io/)). It also integrates with a metrics tracking system called [MLFlow](https://mlflow.org/), that can, optionally, save certain Machine Learning metrics from run to run.


## Technologies
Before jumping the different commands to execute the workflow, some words about the technologies the workflow relies on:

 * **Docker**: used to encapsulate and isolate the dependencies and the small snippets of code that the workflow steps use to interact with Madminer (installed as one of the dependencies). See note below.  

 * **Yadage**: defines the workflow specification language, which the MadMiner workflow is written in. You can edit yaml files to change the settings for the various stages of the workflow. It also includes a command line interface (CLI) tool that coordinates the execution of computational workflows locally. . 

 * **REANA**: a cloud-based platform that coordinates the execution of computational workflows remotely. It can be used to scale up the workflow by distributing event generation, ML training, and inference over many compute nodes. REANA also supports high-performance computing (HPC) backends, so one can deploy REANA on an HPC cluster at a university or lab. Technically, REANA can be [installed locally](https://docs.reana.io/administration/deployment/deploying-locally/), but that isn't the intended use -- the point of REANA is to scale the workflow across a cluster.

 * **MLFlow**: an external component used to store and track certain metrics of the Machine Learning part of the workflow, thanks to the use of its tracking user interface (UI). It is not part of the Madminer-workflow itself, and its usage is optional.

*Note*: The Docker images used within the workflow have been already built and pushed to the [Madminertool DockerHub account](https://hub.docker.com/u/madminertool). Those images are of general purpose, and their maintenance / evolution remains a responsibility of the madminer-workflow developers, not the users.

## The workflow

Below is an image of a full MadMiner workflow (the largest blue box), which includes the two subworkflows. The first blue boxes labeled `workflow_ph[0]` is responsible for event generation with MadGraph and simulation with Delphes running at multiple EFT parameter points, followed by a combine step that produces a single large data file. The `workflow_ml[0]` is responsible the ML portions, and it starts with a sampling the combined data file for training data, three training runs (for SALLY, ALICE, and ALICES methods), evaluation of each of the three trained models, and then a plotting stage.

This is the example workflow in the `madminer-workflow` repository. In the section titled [Workflow parametrization](parametrization), we describe how to modify the workflow's configuration files for your own research purposes.

![image of the workflow](../images/workflow-all.png)