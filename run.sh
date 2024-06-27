#!/bin/bash
echo "Starting Stable Diffusion WebUI"
if [ ! -d "/app/sd-webui" ] || [ ! "$(ls -A "/app/sd-webui")" ]; then
  echo "Files not found, cloning..."

  if [ "$UI" = "auto" ]; then
    echo "Using AUTOMATIC1111"
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git /app/sd-webui
    cd /app/sd-webui
    git checkout dev
  fi

  if [ "$UI" = "forge" ]; then
    echo "Using Forge"
    git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git /app/sd-webui
    cd /app/sd-webui
  fi

  chmod +x /app/sd-webui/webui.sh

  #i don't really know if this is the best way to do this
  python3 -m venv venv
  source ./venv/bin/activate
  pip install insightface
  deactivate

  exec /app/sd-webui/webui.sh $ARGS
else
  echo "Files found, starting..."
  cd /app/sd-webui
  git pull
  exec /app/sd-webui/webui.sh $ARGS
fi
