FROM ubuntu:20.04

ARG LANG="fi_FI.UTF-8"
ARG LANGUAGE=fi_FI
ENV TZ=Europe/Helsinki
ENV HOST_UID=1000
ENV HOST_GID=1000

RUN apt-get update && \
    apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/Europe/Helsinki /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata


RUN apt-get update -y && \
    apt-get install -y sudo apt-utils curl portaudio19-dev build-essential swig libpulse-dev libasound2-dev flac curl git python3.7 python3-pip python3-gi espeak-ng gstreamer-1.0 pulseaudio nano alsa-utils


RUN pip3 install pyaudio
RUN pip3 install python-dotenv
RUN pip3 install pocketsphinx
RUN pip3 install sounddevice
RUN pip3 install pyserial
RUN pip3 install psutil
RUN pip3 install flask
RUN pip3 install torch
RUN pip3 install phonemizer
RUN pip3 install inflect
RUN pip3 install unidecode
RUN pip3 install scipy
RUN pip3 install requests
RUN pip3 install speechrecognition
RUN pip3 install pixel_ring
RUN pip3 install word2number
RUN pip3 install pyaml


RUN addgroup --gid 1000 glados
RUN adduser --uid 1000 --gid 1000 --gecos "" --disabled-password glados
#RUN mkdir /glados-voice-assistant
#RUN chown glados /glados-voice-assistant
USER glados
WORKDIR "/home/glados/glados-voice-assistant"
#CMD python3 ./glados.py
#RUN git clone https://github.com/nerdaxic/glados-voice-assistant/
#RUN git clone https://github.com/nerdaxic/glados-tts.git glados-voice-assistant/glados_tts
