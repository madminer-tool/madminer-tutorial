# Parametrization

One of the most powerful features of the workflow is the ability to parametrize and tune its execution.
Each sub-workflow (PH and ML) constrains a small set of locations where run parameters can be specified.


## Input.yml files
These files, placed within the `workflow` folders of each sub-workflow, contain the pure MadMiner parameters,
as those values are directly injected into MadMiner Python invocations. These files are loaded upon the launch of
a `Makefile` command, so there is no need to rebuild the workflow Docker image upon change.

They are grouped by the workflow step in which they get injected, although the specification of a certain parameter value
on one step, may affect the definition of a different parameter in another step further-down the process.

For the full documentation about what these parameters represent, and what values can they take,
please, visit the [MadMiner documentation][madminer-docs].


## Makefile rules
When running locally, via Yadage, there is a small set of parameters being defined at the `Makefile` level.
These parameters can be found within the `yadage-run` Makefile rule, and they affect either one of the sub-workflows:

In the case of the **PH sub-workflow**:
- `input_file`: path to the input.yml file to use.
- `num_generation_jobs`: number of chunks to split the collision event generation.

In the case of the **ML sub-workflow**:
- `data_file`: path to the Physics sub-workflow events generated file.
- `input_file`: path to the input.yml file to use.
- `mlflow_args_s`: arguments to override the default sampling values.
- `mlflow_args_t`: arguments to override the default training values.
- `mlflow_args_e`: arguments to override the default evaluation values.

In order to override the default MLFlow-specific arguments (specified on the[MLproject][madminer-workflow-mlproject] file),
change the `mlflow_args_` parameters. For example, to override the MLFlow parameters of the _sampling_ step:

```makefile
yadage-run:
    @yadage-run ... \
        -p ... \
        -p mlflow_args_s="test_split=0.5 nuisance_flag=0" \
        -p ...
```


## Reana.yml file
When running the workflow on REANA (which is only available for the complete workflow), the same parameters that are
made available over the `yadage-run` Makefile rule, are made available on the `reana.yml` file within the
[reana folder][madminer-workflow-reana-dir].

However, it is important to understand that some of these parameters (i.e. `mlflow_server` and `mlflow_user`),
are directly provided by the `reana-run` Makefile rule, and must not be filled within the `reana.yml` file.
In short, they must be left empty.


[madminer-docs]: https://madminer.readthedocs.io/en/latest/index.html
[madminer-workflow-mlproject]: https://github.com/scailfin/madminer-workflow-ml/blob/master/MLproject
[madminer-workflow-reana-dir]: https://github.com/scailfin/madminer-workflow/tree/master/reana
