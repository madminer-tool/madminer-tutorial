# Run locally with Yadage

Sometimes it can be convenient to run the workflows locally with Yadage, for debugging purposes.
To do this you do not need REANA, only [Yadage][yadage-docs], serving as the execution engine.

**Yadage** defines the workflow specification language, which the MadMiner workflow is written in, but also
includes a Command Line Interface (CLI) tool that coordinates the execution of workflows locally. 


## Install Yadage
To install Yadage, simply run:

```bash
pip3 install yadage
```

## Launch Docker
If you are running the workflow locally with Yadage, then you will also need to have Docker installed,
as Docker is used to pull the necessary Docker images from DockerHub.


## Run locally
All the combined workflow, as well as the Physics and Machine Learning sub-workflow, have a `Makefile` that defines 
runnable high-level commands for convenience. The main command that you would use in this case is called `yadage-run`.

```bash
make yadage-run
```

This command would run the specified workflow within the `workflow` folder, generating the results within the `.yadage` folder
(an invisible folder only accessible via terminal or IDE).

```bash
cd .yadage
ls -l
```


[yadage-docs]: https://yadage.readthedocs.io/en/latest
