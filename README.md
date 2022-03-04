*** DISCLAIMER ***

I DON'T KNOW WHAT I'M DOING
THIS IS MY FIRST TIME TRYING TO CREATE A DOCKER IMAGE

*** END OF DISCLAIMER ***

This Dockerfile should build a Ubuntu 20.04 based image with all the needed prerequirements for getting 
https://github.com/nerdaxic/glados-voice-assistant to work. Consider this work in progress (as is the app this docker image is for).

It seems AVX2 is required from the CPU. Ubuntu 20.04 because the developer is using it too🤷‍♂️

Usage: clone the glados-voice-assistant repo to your home folder.
```console 
git clone https://github.com/nerdaxic/glados-voice-assistant
``` 

Then clone this repo to your home folder.
``` console
git clone https://github.com/salleq/glados-docker
```

rename the settings.env.sample in the GLaDOS repo to settings.env and modify to your needs. This seems to use whichever sound card and microphone you've chosen in Pulseaudio (?)
Set at least the TTS_SAMPLE_FOLDER to point to /glados-voice-assistant/audio/tts
Also create ~/glados-voice-assistant/audio/tts folder.
Then:
```console 
./build.sh
``` 

check host_runner.sh so that folders are intact. If your used ID is something else than 1000 you may need to edit more stuff.
This doesn't work if your user doesn't have docker access (if you need to 'sudo' to run the next script)
Also your user ID and GID should be 1000, if it's something different then modify host_runner.sh accordingly.

You also have to edit gladosTTS.py in the folder:
add this on line 19(ish):
```python
from subprocess import call
``` 

a few lines below that modify def playFile like this:
```python
def playFile(filename):
        call(["aplay", filename])
```
finally, find the comment #speak from the file and and replace this:
```python
ps('output.wav')
```

with this
```python
call(["aplay", "./output.wav"])
```
save the file.
Then:
```console
./host_runner.sh
```

then you can run the python script (inside the container) with:
```console 
cd /glados-voice-assistant
python3 /glados.py
```

I've had audio working, as long as it's selected from GUI (I don't know if it uses pulseaudio or alsa). I don't know how to change that from console.
