#!/usr/bin/env bash

user=$USER
user_dir=$HOME

docker build --build-arg USER=$user --build-arg USER_DIR=$user_dir -t toolbox .
