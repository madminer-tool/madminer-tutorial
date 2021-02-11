# Bonus: MLFlow

[MLFlow](https://mlflow.org) is a framework that offers developers a consistent way of (1) defining ML projects, (2) run parameterized experiments on those projects, and (3) track results, metrics and artifacts from run to run.

![](../images/mlflow_screenshot.png)

In the case of this workflow, MLFlow has been **integrated to the ML part of the workflow**, in order to provide the third capability: the tracking of results and metrics on consecutive (but different) runs. Therefore, the following explanations apply to the ML sub-workflow, and the complete workflow only, leaving the physics sub-workflow unaffected.

## Preliminary requirements

If you are running remotely on REANA, you will need an MLFlow tracking server up and running. 

This could be provided to you (common case), or deployed by you in a HTTP accessible computer (including your laptop). If you are running the workflow locally with yadage (not using REANA), then you don’t need an MLflow tracking server running. 

To deploy your very own MLFlow tracking server:

```bash
# Install the Python package
pip3 install mlflow

# Launch the tracking server
mlflow server \                                                 
    --host "0.0.0.0" \
    --port 5000 \
    --workers 2 \
    --backend-store-uri "file:///tmp/mlflow/runs/metadata" \
    --default-artifact-root "file:///tmp/mlflow/runs/artifacts"
```

## Connection setup
Once you have an up-and-running MLFlow tracking server, you can specify the connection URL to the workflow just before executing it. If your tracking server instance has been deployed locally, the URL needs to be: `http://host.docker.internal:5000`, otherwise, specify a common URL:

```bash
export MLFLOW_TRACKING_URI=”<the tracking server URL here>”

# One of the following high-level commands
make yadage-run 
make reana-run
```

*Note 1*: There is an additional environment variable to set up in case the MLFlow tracking server was deployed locally, and you are using Linux. This command tells Docker to map the magic string `host.docker.internal` to what Docker considers the “host network”:

```bash
export PACKTIVITY_DOCKER_CMD_MOD="--add-host host.docker.internal:host-gateway"
```

*Note 2*: due to some race conditions within the MLFlow implementation, you may need to preventively create the MLFlow tracking server experiments before running the workflow. This may have been fixed by the time you are reading this, but just in case.

```bash
export MLFLOW_TRACKING_URI=”<the tracking server URL here>”

mlflow experiments create --experiment-name "madminer-ml-sample"
mlflow experiments create --experiment-name "madminer-ml-train"
mlflow experiments create --experiment-name "madminer-ml-eval"
```

