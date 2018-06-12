# Supercharged Machine Learning ToolBox

A [Docker](http://docker.com) image for AMD & ARM devices with [Tensorflow 1.9.0](https://www.tensorflow.org/) an open source software library for numerical computation using data flow graphs that will let you play and learn distinct Machine Learning techniques over [Jupyter Notebook](http://jupyter.org/) an open-source web application that allows you to create and share documents that contain live code, equations, visualizations and explanatory text. Computational Narratives as the Engine of Collaborative Data Science. All this under Python 3.4 language.
There image is a copy on another image based on Python 2.7 [elswork/tensorflow](https://hub.docker.com/r/elswork/tensorflow/) You will find there extended information about this image.

> Be aware! This image is experimental, you should use the other one unless the use of Python 3 would be indispensable!

## Considerations

You will see some warning messages when executing commands in jupyter notebooks this is caused because tensorflow wheel package is built for Python 3.4 and the Python version of container is 3.5, but despite this commands will work as expected.

Most tags of this container should work under amd64 (most computers), arm32v7 tag is for (raspberry, odroid, ...)

## Details

- [GitHub](https://github.com/DeftWork/tensorflow-py3)
- [Docker Hub](https://hub.docker.com/r/elswork/tensorflow-py3/)
- [Deft.Work my personal blog](http://deft.work/tensorflow_for_raspberry)

## Build Instructions

Build for amd64 architecture

```sh
docker build -t elswork/tensorflow-py3:latest .
```

Build for arm32v7 architecture

```sh
docker build -t elswork/tensorflow-py3:latest \
 --build-arg WHL_URL=http://ci.tensorflow.org/view/Nightly/job/nightly-pi-python3/lastSuccessfulBuild/artifact/output-artifacts/ \
 --build-arg WHL_FILE=tensorflow-1.9.0rc0-cp34-none-linux_armv7l.whl .
```

## My Real Usage Example

In order everyone could take full advantages of the usage of this docker container, I'll describe my own real usage setup.
For arm32v7 architecture replace latest by arm32v7 tag.

```sh
docker run -d -p 8888:8888 elswork/tensorflow-py3:latest
```

A more complex sample:

```sh
docker run -d -p 8888:8888 -p 0.0.0.0:6006:6006 \
 --restart=unless-stopped elswork/tensorflow-py3:latest
```

Point your browser to `http://localhost:8888`

First time you open it, you should provide a Token to log on you cand find it with this command:

```sh
docker logs container_name
```

With the second example you can run TensorBoard executing this command in the container:

```sh
tensorboard --logdir=path/to/log-directory --host=0.0.0.0
```

And pointing your browser to `http://localhost:6006`
