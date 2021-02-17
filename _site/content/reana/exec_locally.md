
Sometimes it can be convenient to run the workflows locally for debugging prior to launching the jobs on a remote REANA cluster. To do this you do not need REANA, only [Yadage](https://yadage.readthedocs.io/en/latest/), serving as the execution system. 

**Yadage**: defines the workflow specification language, which the MadMiner workflow is written in. You can edit yaml files to change the settings for the various stages of the workflow. Yadage also includes a command line interface (CLI) tool that coordinates the execution of workflows locally. 

## Install yadage

```bash
pip3 install yadage
```

If you are running locally with Yadage, then you will also need to have Docker installed, as it will be used as the DockerHub image-pulling mechanism. Note, installing docker was already part of the tutorial and was described in the [Preliminaries](../preliminaries) section.

# Running the workflow locally

The combined workflow as well as the physics and machine learning sub-workflow repositories each have a `Makefile` that defines a few high-level commands for convenience. The main command that you use to run the workflow locally is the `yadage-run` command:

```bash
make yadage-run
```

This command would run the specified workflow within the `workflow` folder, generating a set of results within the `.yadage` folder (an invisible folder only accessible via terminal or IDE).

``` bash
cd .yadage
ls -l
```
