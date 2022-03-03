#!/usr/bin/env bash

set -x

echo "Searching for Docker image ..."
DOCKER_IMAGE_ID=$(docker images --format="{{.ID}}" glados:latest | head -n 1)
echo "Found and using ${DOCKER_IMAGE_ID}"

USER_UID=$(id -u)


docker run -t -i \
  --volume=$HOME/glados-voice-assistant:/glados-voice-assistant:rw \
  --volume=/run/user/${USER_UID}/pulse:/run/user/1000/pulse \
  --name glados \
  --privileged \
  -e PULSE_SERVER=unix:/run/user/1000/pulse/native \
  -p 5000:5000 \
  -v /run/user/1000/pulse/native:/run/user/1000/pulse/native \
  -v /dev/snd:/dev/snd \
  -u 1000:1000 \
  ${DOCKER_IMAGE_ID} \
  ${@}

