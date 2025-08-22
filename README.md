# Calkit multi-env example

This repo shows how to use multiple environment types in a
[Calkit](https://github.com/calkit/calkit.git) project,
demonstrating how interacting with them is similar irrespective of their type,
and that there are no "create and mutate" steps--simply define and use
an environment.

To run the pipeline, simply call:

```sh
calkit run
```

This will run multiple different commands,
all in their own environment.
The different environment types are:

- Conda
- Docker (with and without a local Dockerfile)
- venv
- uv (both project and venv variants)
- Pixi (two variants)

Project environments can be listed with:

```sh
calkit list environments
```

and an individual environment can be checked like:

```sh
calkit check environment --name mv-venv
```

A command can be run in an environment like:

```sh
calkit xenv -n my-venv -- which python
```

See `calkit.yaml` for more details.

## Why would I ever want to do this?

Research projects can have diverse requirements for different tasks
within.
You may need a certain set of dependencies for collecting data,
or running a simulation,
or creating a certain type of visualization.
You may want to build a Paper with LaTeX.
You can use a different environment for each in case there are conflicts
that prevent creating one big monolithic one.

There's also the issue of caching.
In a Calkit pipeline, if an environment changes, any stages'
results are then invalidated.
It may be beneficial to have each stage use its own environment to
prevent invalidating results that are expensive to generate.
For example, if a simulation and visualization stage share an environment,
and the visualization stage needs a new package,
the simulation results would technically be invalidated.
To prevent the cache invalidation, each stage can use its own environment,
which also reduces coupling.
