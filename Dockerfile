FROM python:3.9-bullseye

COPY . /app

WORKDIR /app

RUN apt update &&\
  apt install -y aapt apksigner apktool zipalign

RUN wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip &&\
  unzip platform-tools-latest-linux.zip &&\
  ln -s /app/Downloads/platform-tools/adb /usr/bin/

RUN pip install -r requirements.txt &&\
  python setup.py install

