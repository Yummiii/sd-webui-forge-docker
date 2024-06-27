A docker image for [Stable Diffusion WebUI Forge](https://github.com/lllyasviel/stable-diffusion-webui-forge) or the AUTO1111 WebUI

> [!WARNING]
> This Dockerfile is based on on Cuda 12.3, which requires Nvidia driver >=545.
> In [Ubuntu 22.04](https://github.com/Yummiii/sd-webui-forge-docker/issues/1#issuecomment-2066840527) you can update it by running `ubuntu-drivers install nvidia:545` and a reboot. (Thanks [@casao](https://github.com/Casao))

# Docker compose
To run it, you will need the [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

Create a directory. Inside this directory, create a subdirectory named `data` (if you don't and let docker create it, there might be permission issues) and a file named `docker-compose.yml`. Add the following content to the 'docker-compose.yml' file:

```YML
services:
  webui:
    image: "ghcr.io/yummiii/sd-webui-forge-docker:latest"
    volumes:
      - "./data:/app/sd-webui"
    ports:
      - "7860:7860"
    environment:
      - "ARGS=--listen --enable-insecure-extension-access" # Insecure extension access is required if you want to install extensions with the listen flag
      - "UI=forge" # Specifies the UI that will be downloaded, forge for the forge webui or auto for the AUTOMATIC1111 webui
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
