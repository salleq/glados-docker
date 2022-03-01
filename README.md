*** DISCLAIMER ***

I DON'T KNOW WHAT I'M DOING
THIS IS MY FIRST TIME TRYING TO CREATE A DOCKER IMAGE

*** END OF DISCLAIMER ***

This Dockerfile should build a Ubuntu 20.04 based image with all the needed prerequirements for getting 
https://github.com/nerdaxic/glados-voice-assistant to work. Consider this work in progress (as is the app this docker image is for).

It seems AVX2 is required from the CPU.

Usage:

git clone
rename the settings.env.sample to settings.env and modify to your needs.
docker build -t=local:glados .
docker run --container_name glados --device /dev/snd -p 5000:5000 -it local:glados /bin/bash
then you can run the python script with 'python3 /glados-voice-assistant/glados.py'
(doesn't seem to work yet)

I don't know if microphone works and if it's possible to get working.
