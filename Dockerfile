FROM ubuntu:18.04

LABEL Description="QGis3 Desktop" Version="1.0" maintainer="krzysztof@krawczyk.czest.pl"

ENV USER_ID 1000
ENV USER_NAME qgis-user
ENV USER_GROUP_ID 1000
ENV USER_GROUP_NAME qgis-group

ADD start-qgis.sh /bin/

RUN groupadd -g $USER_GROUP_ID $USER_GROUP_NAME \
    && useradd --shell /bin/bash --uid $USER_ID --gid $USER_GROUP_ID $USER_NAME \
    && apt update

ADD conf/apt/*.list /etc/apt/sources.list.d/

RUN  apt install -y gpg wget \
    && wget -O - https://qgis.org/downloads/qgis-2019.gpg.key | gpg --import \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-key 51F523511C7028C3 \
    && apt update \
    && DEBIAN_FRONTEND=noninteractive TZ=UTC apt install -y graphviz tzdata qgis \
    && apt clean \
    && chmod a+x /bin/start-qgis.sh

ENTRYPOINT ["/bin/start-qgis.sh"]
