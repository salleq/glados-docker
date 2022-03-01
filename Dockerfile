FROM ubuntu:20.04

ENV LANG="fi_FI.UTF-8"
ENV LANGUAGE=fi_FI
ENV TZ=Europe/Helsinki

RUN apt-get update && \
    apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/Europe/Helsinki /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata


RUN apt-get update -y && \
    apt-get install -y sudo apt-utils curl portaudio19-dev build-essential swig libpulse-dev libasound2-dev flac curl git python3.7 python3-pip python3-gi espeak-ng gstreamer-1.0


RUN pip3 install pyaudio
RUN pip3 install python-dotenv
RUN pip3 install pocketsphinx
RUN pip3 install sounddevice
RUN pip3 install pyserial
RUN pip3 install psutil
RUN pip3 install playsound
RUN pip3 install flask
RUN pip3 install torch
RUN pip3 install phonemizer
RUN pip3 install inflect
RUN pip3 install unidecode
RUN pip3 install scipy
RUN pip3 install requests
RUN pip3 install speechrecognition


RUN git clone https://github.com/nerdaxic/glados-voice-assistant/
RUN git clone https://github.com/nerdaxic/glados-tts.git glados-voice-assistant/glados_tts

ADD settings.env /glados-voice-assistant
