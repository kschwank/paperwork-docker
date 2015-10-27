FROM ubuntu:latest

RUN useradd paperworker

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y sane tesseract-ocr tesseract-ocr-deu

RUN apt-get install -y python-pip python-setuptools python-dev python-gi python-whoosh

RUN apt-get install -y libpng12-dev libjpeg-dev zlib1g-dev libfreetype6-dev

RUN apt-get install -y libblas-dev libatlas-dev liblapack-dev gfortran

RUN apt-get install -y g++

RUN apt-get install -y cython

RUN apt-get install -y libenchant-dev

RUN apt-get install -y libcairo2-dev libglade2-dev libgtk-3-dev libpoppler-dev

RUN apt-get install -y gir1.2-gladeui-2.0 gir1.2-poppler-0.18 python-gi-cairo

RUN pip install numpy scikit-learn

RUN pip install scipy

RUN pip install paperwork

RUN mkdir -p mkdir /home/paperworker

RUN chown -R paperworker /home/paperworker

RUN usermod -a -G scanner paperworker

VOLUME /home/paperworker/papers

VOLUME /home/paperworker/.local/share/paperwork

USER paperworker

ENTRYPOINT ["/usr/local/bin/paperwork"]

