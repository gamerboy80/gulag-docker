FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y software-properties-common git wget mysql-server nginx build-essential
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y python3.9 python3.9-dev python3.9-distutils
RUN mkdir /gulag
WORKDIR /gulag
RUN wget https://bootstrap.pypa.io/get-pip.py && python3.9 get-pip.py && rm get-pip.py
RUN git clone https://github.com/cmyui/gulag.git .
RUN git submodule init && git submodule update
WORKDIR /gulag/oppai-ng
RUN ./build
WORKDIR /gulag
RUN python3.9 -m pip install -r ext/requirements.txt
COPY ./config.py /gulag/config.py
COPY ./nginx.conf /etc/nginx/sites-enabled/gulag.conf
COPY ./certs /gulag/certs
COPY ./entrypoint.sh /gulag/entrypoint.sh
RUN mkdir -p /gulag/.data/avatars
COPY ./default.jpg /gulag/default.jpg
VOLUME ["/gulag/.data"]
EXPOSE 80
EXPOSE 443
ENTRYPOINT ./entrypoint.sh
