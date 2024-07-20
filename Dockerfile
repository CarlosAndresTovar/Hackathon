FROM ubuntu:20.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install -y python3 python3-pip

RUN pip3 install flask

WORKDIR /opt/hackathon

COPY ./flask_aplication /opt/hackathon

WORKDIR /opt/hackathon

ENV FLASK_APP=aplication_flask.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_DEBUG=1

CMD ["flask", "run"]