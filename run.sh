#!/bin/bash
echo "Starting Stable Diffusion WebUI"
if [ ! -d "/app/sd-webui" ] || [ ! "$(ls -A "/app/sd-webui")" ]; then
  echo "Files not found, cloning..."

  git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git /app/sd-webui
  chmod +x /app/sd-webui/webui.sh
  cd /app/sd-webui
  exec /app/sd-webui/webui.sh $ARGS
else
  echo "Files found, starting..."
  cd /app/sd-webui
  git pull
  exec /app/sd-webui/webui.sh $ARGS
fi 