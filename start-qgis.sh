#!/bin/bash

if [ ! -d /qgishome ]; then
    mkdir /qgishome
    chown $USER_NAME:$USER_GROUP_NAME /qgishome
fi

su $USER_NAME -c '/usr/bin/qgis --profiles-path /qgishome/'

