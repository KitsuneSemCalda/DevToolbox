#!/usr/bin/env bash

docker run -it --name toolbox -v $HOME:$HOME toolbox /bin/bash; cleanup_docker
