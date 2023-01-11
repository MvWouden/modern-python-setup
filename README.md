# modern-python-setup

A modern python setup, complete with CI, testing, linting, static analysis which is dockerized.

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
docker compose run app <command>
```

### Poetry

Starting a new package:

```shell
poetry new --src <package_name>
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
poetry add <package_name>  # --group dev
```

Remove a dependency:

```shell
poetry remove <package_name>  # --group dev
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

### Pre-commit

Run all pre-commit hooks:

```shell
pre-commit run -a
```
