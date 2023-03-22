# Development Tools Container

This project is a custom Dockerfile to create a container with the development tools I use regularly. The container has been configured to simplify the installation and configuration of these tools across different development environments, saving time and effort.

## Usage

To use the development tools container, follow the steps below:

1. Clone this repository: `git clone https://github.com/yourusername/repositoryname.git`
2. Navigate to the repository directory: `cd repositoryname`
3. Build the container: `docker build -t imagename .`
4. Run the container: `docker run -it imagename`

The `docker build` command compiles the Dockerfile and creates the container image. The `-t` argument allows you to assign a name to the image. In the example above, the image name is `imagename`. The dot at the end indicates that the Dockerfile is in the current directory.

The `docker run` command runs the container based on the created image. The `-it` argument allows you to access the container's interactive terminal.

## Tools

- Lunarvim
- Clang
- Asdf
- Xmake

## Contributing

If you have suggestions or improvements for the Dockerfile, feel free to open an issue or pull request in this repository.

## License

This project is licensed under the Apache License, Version 2.0. See the [LICENSE](LICENSE) file for more information.
