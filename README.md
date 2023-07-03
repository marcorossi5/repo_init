# Useful Snippets to initialize a repository

## Docker

Find a dockerfile template exploiting docker compose to deploy an image built
for python, whose dependencies are managed by poetry.

Managing packages with poetry requires the presence at least of `pyproject.toml`
file in the same directory of the `Dockerfile` to work.

:warning: Note: remember to review the code to replace the template fields like
`<template>` with the correct values.

In order to add requirements packages with poetry from a `requirements.txt` file
in one command, use:

```bash
cat path/to/requirements.txt | xargs poetry add
```
