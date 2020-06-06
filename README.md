# OpenJFX

```sh
$ docker build --no-cache --build-arg MAVEN_VERSION=3.6.3-openjdk-11-slim --build-arg USERMAIL=user@user --build-arg USER=user@user --file Dockerfile . --tag image-name:latest
```
```sh
$ xhost +local:docker
```
```sh
$ docker run -it --volume /tmp/.X11-unix:/tmp/.X11-unix --env DISPLAY=unix$DISPLAY --name container-name container-id
```
