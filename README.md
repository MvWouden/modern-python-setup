# MPSREPO

MPSDESC

## Commands

### Docker (Compose)

Building the docker container in a detached state:

```shell
docker compose up --build -d
```

Building the development docker container in a detached state:

```shell
docker compose -f docker-compose-dev.yml up --build -d
```

Stopping the docker container:

```shell
docker compose down
```

Running a command in the container:

```shell
docker compose run MPSSRC_app <command>
```

### Poetry

Starting a new package:

```shell
poetry new --src MPSSRC
```

Installing dependencies:

```shell
poetry install  # --with/without <group>
```

Updating dependencies:

```shell
poetry update  # <package1_name> <package2_name>
```

Add a dependency:

```shell
poetry add MPSSRC  # --group dev
```

Remove a dependency:

```shell
poetry remove MPSSRC  # --group dev
```

List available packages:

```shell
poetry show
```

Run a command with poetry:

```shell
poetry run <command>
```

Validate the structure of `pyproject.toml`:

```shell
poetry check
```

Export the dependencies to a `requirements.txt` file:

```shell
poetry export --without dev -f requirements.txt --output requirements.txt
```

Export the dev-dependencies to a `requirements-dev.txt` file:

```shell
poetry export --with dev -f requirements.txt -o dev-requirements.txt
```

### Pre-commit

Install pre-commit hooks:

```shell
pre-commit install
```

Run all pre-commit hooks:

```shell
pre-commit run -a
```

### Sphinx

Build the modules:

```shell
poetry run sphinx-apidoc -f -o docs MPSSRC
```

Build the documentation files:

```shell
poetry run make -C docs html
# documentation can now be found at docs/_build/html/index.html
```

Clean the documentation files:

```shell
poetry run make -C docs clean
```
