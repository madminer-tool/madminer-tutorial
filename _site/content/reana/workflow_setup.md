

## Workflow repositories
The workflow is currently split into 3 different GitHub repositories:

  * [Scailfin/madminer-workflow-ph](https://github.com/scailfin/madminer-workflow-ph): containing the event generation and detector simulation part.
  * [Scailfin/madminer-workflow-ml](https://github.com/scailfin/madminer-workflow-ml): containing the ML training and inference part.
  * [Scailfin/madminer-workflow](https://github.com/scailfin/madminer-workflow): wrapping both parts to construct the complete workflow.

The distribution of the workflow into 2 separate sub-workflows (PH and ML) with a wrapper around them, allows us to make both of those sub-workflow **locally** executable on their own. This way, researchers have the option to **locally** run a particular part of the complete workflow multiple times, and with different parameters, without having to deal with the other part.


## Workflow setup

In order to setup the workflow locally, you can just clone the [madminer-workflow](https://github.com/scailfin/madminer-workflow) repository,  as long as the two wrapped sub-workflows by running:

```bash
git clone --recurse-submodules https://github.com/scailfin/madminer-workflow
```

This command will also clone the physics (PH) and machine learning (ML) sub-workflows inside the modules folder. You can also install them separately (if you want to interact with them in a separate manner), by running:

```bash
git clone https://github.com/scailfin/madminer-workflow-ml
git clone https://github.com/scailfin/madminer-workflow-ph
```
## The default example

These repositories define a default workflow as an example, but you would modify the configuration files to change the physics process that you are interested in, the number of events to generate, modify the detector simulation settings, choose which machine learning models and inference strategies you would like to use, etc. In the section titled [Parametrize the workflow](parametrization), we describe how to modify the workflow's configuration files for your own research purposes. You can skip that for now and go straight to executing the default example workflow. 

The image below shows the default workflow. The first blue boxes labeled `workflow_ph[0]` is responsible for event generation with MadGraph and simulation with Delphes, which is parallelized across 6 different event-generation jobs.  It is followed by a combine step that produces a single large data file with the information needed to for training (including the event weights for multiple EFT parameter points). The `workflow_ml[0]` is responsible the ML portions, and it performs a test/train/validate split and trains three different models (for the SALLY, ALICE, and ALICES methods). Later it evaluates each of the three trained models and concludes with a plotting stage.

![image of the workflow](../images/workflow-all.png)
