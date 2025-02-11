FROM ubuntu:24.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y wget git vim zsh software-properties-common

RUN apt update && \
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb && \
    dpkg -i cuda-keyring_1.1-1_all.deb && \
    apt-get update && \
    apt-get -y install nvidia-cuda-toolkit

RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt update && \
    apt install -y python3.12-full
RUN python3.12 -m venv /root/venv-p3.12
ADD requirements.txt /root/requirements.txt
RUN . /root/venv-p3.12/bin/activate && python3.12 -m pip install -r /root/requirements.txt
