# Uptime Kuma docker container

![GitHub action workflow status](https://github.com/AgorastisMesaio/docker-img-uptime/actions/workflows/docker-publish.yml/badge.svg)

This repository contains a `Dockerfile` aimed to create a *base image* to provide a dockerized easy-to-use self-hosted monitoring tool. It's based on the great project [Uptime Kuma](https://github.com/louislam/uptime-kuma).

- Start your services

```sh
docker compose up --build -d
```

## For developers

If you copy or fork this project to create your own base image.

### Building the Image

To build the Docker image, run the following command in the directory containing the Dockerfile:

```sh
docker build -t your-image/docker-img-uptime:main .
```
