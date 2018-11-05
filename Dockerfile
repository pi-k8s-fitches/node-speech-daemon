FROM resin/rpi-raspbian

RUN apt-get update && \
    apt-get install -y python-pip rpi-update && \
	rpi-update && \
    apt-get install -y omxplayer && \
	mkdir -p /opt/pi-k8s

WORKDIR /opt/pi-k8s

ADD requirements.txt .

RUN pip install -r requirements.txt

ADD bin bin
ADD lib lib
ADD test test

ENV PYTHONPATH "/opt/pi-k8s/lib:${PYTHONPATH}"

CMD "/opt/pi-k8s/bin/daemon.py"
