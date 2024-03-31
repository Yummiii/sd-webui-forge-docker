A docker image for [Stable Diffusion WebUI Forge](https://github.com/lllyasviel/stable-diffusion-webui-forge)

# Docker compose
To run it, you will need the [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

Create a directory. Inside this directory, create a subdirectory named `data` and a file named `docker-compose.yml`. Add the following content to the 'docker-compose.yml' file:

```YML
services:
  webui:
    image: "ghcr.io/yummiii/sd-webui-forge-docker:latest"
    volumes:
      - "./data:/app/sd-webui"
    ports:
      - "7860:7860"
    environment:
      - "ARGS=--listen"
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: 1
              capabilities: [gpu]
```
then run it with `docker compose up`.

You can set which arguments the webui will recive with the `ARGS` environment variable
