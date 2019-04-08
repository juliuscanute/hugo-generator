Docker Commands
===============

Build Image
-----------
The command below builds the docker image.
```bash
docker build -t hugo-builder-image .
```


Run Image
---------
The command below runs the container using the previously built image in interactive mode. Verify you are able to run *aws* and *hugo* commands.
```bash
docker run -it hugo-builder-image /bin/bash
```