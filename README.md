# Toolbox

This repository contains the files needed to create a Docker container based development environment for Arch Linux, with some utilities and configurations pre-installed.

## How to use

### Prerequisites
 - Docker installed.

#### Cloning the repository
Clone the repository on your local machine:


```bash
git clone https://github.com/KitsuneSemCalda/DevToolbox
cd DevToolbox
```

#### Install helpers

The install needs a root to configure the /usr/bin

```bash
sudo bash tools/install.sh
```

This commands copy the dockerfile and the scripts to /usr/local/bin/toolkit/

After this, create symlinks to /usr/bin/create_docker /usr/bin/launch_toolkit

#### Build the image

```bash
create_docker
```

Create docker is a script to run docker build with principal configs of dockerfile. He passes of transparent form the args:

- USER
- HOME

#### Start the container

```bash
launch_toolkit
```

This script run the toolbox passing the real $HOME to container $HOME

#### Cleaning the system

```bash
cleanup_docker
```

This script run all possible prune to clean docker before execution

## Installed

- bat  
- exa 
- htop 
- tmux 
- neovim 
- sudo 
- base-devel 
- inetutils
- xmake 
- asdf-vm 
- xorriso 
- elixir 
- grub 
- mtools 
- qemu 
- clang 
- cargo 
- rust  
- npm   
- yarn  
- nasm  
- git   
- git-lfs

### Contributing

If you'd like to contribute to this project, feel free to open an issue or submit a pull request. If you plan to submit a pull request, please be sure to follow these guidelines:

Make a branch and work on your own branch.
Make sure your commits are self-explanatory.
Make sure your code follows best practices and is properly tested.

### License

This source uses the Apache License
