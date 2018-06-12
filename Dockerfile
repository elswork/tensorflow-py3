FROM ubuntu:16.04

LABEL mantainer="Eloy Lopez <elswork@gmail.com>"

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    libfreetype6-dev \
    libpng12-dev \
    libzmq3-dev \
    pkg-config \
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-scipy \
    rsync \
    software-properties-common \
    unzip \
    git \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ARG WHL_URL=https://storage.googleapis.com/tensorflow/linux/cpu/
ARG WHL_FILE=tensorflow-1.9.0rc0-cp34-cp34m-linux_x86_64.whl

RUN python -m pip3 install --upgrade pip3 && \
    pip3 --no-cache-dir install \
     ipykernel \
     jupyterlab \
     matplotlib \
     numpy \
     sklearn \
     pandas \
     && \
     curl -O ${WHL_URL}${WHL_FILE} && \
     mv ${WHL_FILE} tensorflow-1.9.0rc0-py3-none-any.whl && \
     pip3 --no-cache-dir install tensorflow-1.9.0rc0-py3-none-any.whl && \
     rm -f tensorflow-1.9.0rc0-py3-none-any.whl && \
     python3 -m ipykernel.kernelspec	

COPY jupyter_notebook_config.py /root/.jupyter/

# Copy sample notebooks.
COPY notebooks /notebooks

# TensorBoard & Jupyter
EXPOSE 6006 8888

WORKDIR "/notebooks"

CMD jupyter lab --ip=* --no-browser --allow-root
