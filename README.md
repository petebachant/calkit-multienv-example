# Calkit multi-env example

This repo shows how to use multiple environment types in a Calkit project.
To run the pipeline, simply call:

```sh
calkit run
```

This will run multiple different commands,
all in their own environment.
One will use Pixi, another will use Conda, another uv,
another a uv venv (rather than project,)
another an alternative Pixi environment, and another Docker.
See `calkit.yaml` for details.

## Why would I ever want to do this?

Research projects can have diverse requirements for different tasks
within.
You may need a certain set of dependencies for collecting data,
or running a simulation,
or creating a certain type of visualization.
You may want to build a Paper with LaTeX.
You can use a different environment for each in case there are conflicts
that prevent creating one big monolithic one.
