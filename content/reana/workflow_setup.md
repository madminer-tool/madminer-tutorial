# Workflow setup

In order to setup the workflow locally, you can just clone the [madminer-workflow](https://github.com/scailfin/madminer-workflow) repository,  as long as the two wrapped sub-workflows by running:

```bash
git clone --recurse-submodules https://github.com/scailfin/madminer-workflow
```

This command will also clone the phyiscs (PH) and machine learning (ML) sub-workflows inside the modules folder. You can also install them separately (if you want to interact with them in a separate manner), by running:

```bash
git clone https://github.com/scailfin/madminer-workflow-ml
git clone https://github.com/scailfin/madminer-workflow-ph
```

Then, depending whether you want to run the workflow locally, or remotely, both Yadage and the `reana-client` command line interface (CLI) would need to be installed:

```bash
pip3 install yadage
pip3 install reana-client
```

The official documentation and the README files of these repositories recommend creating a Python virtual environment to install these packages. However, if your interaction with the project is going to be from a user perspective, this is not mandatory.

If you are running locally with yadage, then you will also need to have Docker installed, as it will be used as the DockerHub image-pulling mechanism. Note, installing docker was already part of the tutorial and was described in the [Preliminaries](../preliminaries) section.