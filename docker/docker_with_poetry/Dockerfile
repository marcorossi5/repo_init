# install poetry for managing dependencies
FROM python:3.11 AS base
LABEL maintainer="Marco Rossi <rssmrc.11@gmail.com>"

ENV POETRY_VERSION=1.5.1
ENV VIRTUAL_ENV=/opt/venv
ENV PATH=$ENV_PATH/bin:$PATH

# create a venv to let poetry install dependencies in one place
RUN pip install -U pip && python -m venv $VIRTUAL_ENV

# install poetry
RUN apt update && apt upgrade -y && pip install "poetry==$POETRY_VERSION"

# install dependencies
COPY ["pyproject.toml", "poetry.lock", "/tmp"]
RUN poetry run -C /tmp pip install --upgrade pip
RUN poetry install --no-interaction --no-root -C /tmp

# prod image
FROM python:3.11 as prod

ENV ENV_PATH=/opt/venv

# copy python dependencies from previous stage and leave poetry behind
COPY --from=base $ENV_PATH $ENV_PATH

COPY startup.sh /root/

# docker-compose not available in prod, must copy files in the image
WORKDIR /home/ai
COPY ./src /home/ai

SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["/root/startup.sh"]
CMD ["python3", "-u", "main.py"]
