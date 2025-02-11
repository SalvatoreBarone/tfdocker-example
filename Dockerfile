FROM ubuntu:24.04
ARG DEBIAN_FRONTEND=noninteractive
ARG target 
RUN apt update && apt install -y software-properties-common nvidia-cuda-toolkit

RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt update && \
    apt install -y python3-full python3-pip

WORKDIR /root
ADD requirements.txt /root/requirements.txt
RUN pip3 install -r /root/requirements.txt --break-system-packages
