# Golang Development Container Image Definition

This repository contains the configuration for a Golang development container.

## Features

- Golang development environment
- Pre-installed dependencies and tools

## Requirements

- Tool to build OCI compatible container images, for example docker, buildah etc.

## Getting Started

1. Clone the repository:
    ```sh
    git clone https://github.com/amaic/dockerfiles.git
    cd dockerfiles
    ```

2. Build the container image with docker CLI:
    ```sh
    docker 
    ```

3. Access the container:
    ```sh
    docker-compose exec golang bash
    ```

## Configuration

- `Dockerfile`: Defines the Golang development environment.
- `docker-compose.yml`: Configures the services and volumes.

## Usage

- Place your Golang source code in the `src` directory.
- Use `docker-compose` commands to manage the container lifecycle.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.