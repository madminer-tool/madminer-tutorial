# Parametrization

One of the most powerful features of the workflow is the ability to parametrize and tune the workflow execution. Each sub-workflow (PH and ML) constrains a small set of locations where runnable parameters can be specified.


## Input.yml files
These files, placed within the corresponding `workflow` folders, contain the pure MadMiner parameters, as those values are directly injected into MadMiner Python invocations. These files are loaded upon the launch of a `Makefile` command (either Yadage or REANA related), so there is no need to rebuild the workflow Docker image upon change.

They are grouped by the workflow step in which they get injected, although the specification of a certain parameter value on a step, may affect the definition of a different parameter in a further-down step.

For the full documentation about what these values represent, and what values can they take, please, visit the [MadMiner documentation](https://madminer.readthedocs.io/en/latest/index.html).

## Makefile rules

When running locally, via Yadage, there is a small set of parameters being defined at the Makefile level. These parameters can be found within the `yadage-run` Makefile rule, and they address characteristics of the workflow coordination itself. They change depending on the sub-workflow they are referencing:

In the case of the PH sub-workflow:

 * `input_file`: path to the input.yml file to use.
 * `num_jobs`: number of chunks to split the collision event generation.

In the case of the ML sub-workflow:

 * `data_file`: path to the Physics sub-workflow events generated file.
 * `input_file`: path to the input.yml file to use.
 * `mlflow_args_s`: arguments to override the default MLproject ones on the sample step
 * `mlflow_args_t`: arguments to override the default MLproject ones on the training step
 * `mlflow_args_e`: arguments to override the default MLproject ones on the eval. step.

A good example of passing MLFlow arguments to override defaults is the following:

```
-p mlflow_args_s="test_split=0.5 nuisance_flag=0"
```

Note: when an empty set of MLFlow arguments are provided through the Makefile, the empty string needs to be wrapped up in a weird set of quotes in order for the underlying engine (Yadage) to properly understand empty string, instead of NULL value. Check out [this GitHub issue](https://github.com/yadage/yadage/issues/101) for more information.


## Reana.yml file

When running the workflow on REANA (which is only available for the complete workflow), the same parameters that are made available over the `yadage-run` Makefile rule, are made available on the `reana.yml` file within the [`reana` folder](https://github.com/scailfin/madminer-workflow/tree/master/reana).

However, it is important to understand that some of these parameters (i.e. `mlflow_server` and `mlflow_user`), are directly provided by the `reana-run` Makefile rule, and must not be specified within the `reana.yml` file. In short, they must be left empty.



