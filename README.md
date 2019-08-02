# Overview
Docker container used to run QGis desktop application. Container is based on the latest QGis3 version provided by UbuntuGIS repository (https://wiki.ubuntu.com/UbuntuGIS)

# Building docker image

To build docker image run:
```
docker build -t kkrawczyk85/qgis3 .
```

# Volumes
QGis profile directory is placed under /qgishome, so if you need to persist / share data between container and the host map this directory.

# Run qgis
To get QGis working with desktop environment installed on host machine, you need to mount X11 socket directory to the container and set the DISPLAY environment variable. You can also map directory as /qgishome to persist QGis configuration:
```
docker run -v /tmp/.X11-unix:/tmp/.X11-unix -v "${PWD}/qgishome":/qgishome -e DISPLAY=unix$DISPLAY --rm --name ubuntugis -it kkrawczyk85/qgis3
```

# License
[GPL V2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html)
