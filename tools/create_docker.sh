#!/usr/bin/env bash

user=$USER
user_dir=$HOME

docker build --build-arg USER=$user --build-arg USER_HOME=$user_dir -t toolbox .
