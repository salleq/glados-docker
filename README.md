*** DISCLAIMER ***

I DON'T KNOW WHAT I'M DOING
THIS IS MY FIRST TIME TRYING TO CREATE A DOCKER IMAGE

*** END OF DISCLAIMER ***

This Dockerfile should build a Ubuntu 20.04 based image with all the needed prerequirements for getting 
https://github.com/nerdaxic/glados-voice-assistant to work. Consider this work in progress (as is the app this docker image is for).

It seems AVX2 is required from the CPU. Ubuntu 20.04 because the developer is using it too🤷‍♂️

Usage: clone the repo to your home folder
```console 
git clone 
``` 
rename the settings.env.sample in the GLaDOS repo to settings.env and modify to your needs.
```console 
./build.sh
``` 

check host_runner.sh so that folders are intact. If your used ID is something else than 1000 you may need to edit more stuff.
This doesn't work if your user doesn't have docker access (if you need to 'sudo' to run the next script)

```console
./host_runner.sh
```

then you can run the python script (inside the container) with:
```console 
python3 /glados-voice-assistant/glados.py
```
(doesn't seem to work yet)

I don't know if microphone works and if it's possible to get working.
