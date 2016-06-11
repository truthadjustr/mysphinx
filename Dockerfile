FROM ubuntu:latest
MAINTAINER truthadjustr at gmail dot com
LABEL description="sphinx rst documenation"

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    net-tools \
    git \
    vim-tiny \
    python-pip \
    python-setuptools \
    && pip install sphinx_rtd_theme 

COPY dotbashrc /root/.bashrc
COPY tmux.conf welcome.ascii /etc/
