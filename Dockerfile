FROM ubuntu:24.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y wget git vim zsh software-properties-common nvidia-cuda-toolkit

RUN apt update && apt install -y 

RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt update && \
    apt install -y python3.12-full
ADD requirements.txt /root/requirements.txt
RUN python3.12 -m pip install -r /root/requirements.txt && python3.12 -m pip install 'tensorflow[and-cuda]'
