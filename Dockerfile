FROM ubuntu:latest

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:rolfbensch/sane-git

RUN apt-get update -y && apt-get install -y usbutils sane sane-utils tesseract-ocr tesseract-ocr-deu

# grab gosu for easy step-down from root
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN apt-get update -y && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \
        && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture)" \
        && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture).asc" \
        && gpg --verify /usr/local/bin/gosu.asc \
        && rm /usr/local/bin/gosu.asc \
        && chmod +x /usr/local/bin/gosu \
        && apt-get purge -y --auto-remove ca-certificates wget

RUN apt-get update -y && apt-get install -y python-pip python-setuptools python-dev python-gi python-whoosh

RUN apt-get install -y libpng12-dev libjpeg-dev zlib1g-dev libfreetype6-dev

RUN apt-get install -y libblas-dev libatlas-dev liblapack-dev gfortran

RUN apt-get install -y g++

RUN apt-get install -y cython

RUN apt-get install -y libenchant-dev

RUN apt-get install -y libcanberra-gtk-module

RUN apt-get install -y libcairo2-dev libglade2-dev libgtk-3-dev libpoppler-dev

RUN apt-get install -y gir1.2-gladeui-2.0 gir1.2-poppler-0.18 python-gi-cairo

RUN pip install numpy scipy

RUN pip install scikit-learn

RUN pip install paperwork

RUN adduser --home /home/paperworker --disabled-password --gecos "" --uid 1000 paperworker

RUN adduser paperworker plugdev
RUN adduser paperworker scanner

COPY docker-entrypoint.sh /docker-entrypoint.sh

VOLUME /home/paperworker

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["paperwork"]
