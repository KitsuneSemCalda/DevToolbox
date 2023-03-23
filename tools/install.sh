#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
  echo "This script needs to be run as root"
  exit 1
fi

if [[ ! -f "/usr/local/bin/toolkit" ]]; then
  mkdir -p "/usr/local/bin/toolkit"
fi

if [[ ! -f "tools/create_docker.sh" ]]; then
  echo "The 'create_docker.sh' script is missing"
  exit 1
fi

if [[ ! -f "tools/launch_toolkit.sh" ]]; then
  echo "The 'launch_toolkit.sh' script is missing"
  exit 1
fi

if [[ -f "/usr/local/bin/toolkit/create_docker.sh" ]]; then
  echo "The 'create_docker.sh' script already exists in /usr/local/bin/toolkit"
else
  chmod +x "tools/create_docker.sh"
  cp "tools/create_docker.sh" "/usr/local/bin/toolkit"
fi

if [[ -f "/usr/local/bin/toolkit/launch_toolkit.sh" ]]; then
  echo "The 'launch_toolkit.sh' script already exists in /usr/local/bin/toolkit"
else
  chmod +x "tools/launch_toolkit.sh"
  cp "tools/launch_toolkit.sh" "/usr/local/bin/toolkit"
fi

if [[ -f "/usr/local/bin/toolkit/cleanup_docker.sh" ]]; then
  echo "The cleanup_docker script already exists in /usr/local/bin/toolkit/"
else
  chmod +x "tools/cleanup_docker.sh"
  cp "tools/cleanup_docker.sh" "/usr/local/bin/toolkit/"
fi

ln -sf "/usr/local/bin/toolkit/create_docker.sh" "/usr/bin/create_docker"
cp "Dockerfile" "/usr/local/bin/toolkit/"
ln -sf "/usr/local/bin/toolkit/launch_toolkit.sh" "/usr/bin/launch_toolkit"

COMMAND="/usr/local/bin/toolkit/docker-cleanup.sh"

if ! crontab -l | grep -q "$COMMAND"; then
  (crontab -l 2>/dev/null; echo "*/5 * * * * $COMMAND") | crontab -
fi
