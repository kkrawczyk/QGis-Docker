FROM ubuntu:18.04

ENV USER_ID 1000
ENV USER_NAME qgis-user
ENV USER_GROUP_ID 1000
ENV USER_GROUP_NAME qgis-group

ADD start-qgis.sh /bin/

RUN groupadd -g $USER_GROUP_ID $USER_GROUP_NAME \
    && useradd --shell /bin/bash --uid $USER_ID --gid $USER_GROUP_ID $USER_NAME \
    && apt update \
    && DEBIAN_FRONTEND=noninteractive \
    && TZ=UTC \
    && apt-get -y install software-properties-common ca-certificates graphviz tzdata \
    && add-apt-repository -y ppa:ubuntugis/ppa \
    && apt update \ 
    && apt install -y qgis \
    && apt clean \
    && chmod a+x /bin/start-qgis.sh

ENTRYPOINT ["/bin/start-qgis.sh"]
