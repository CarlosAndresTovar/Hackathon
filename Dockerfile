FROM ubuntu:20.04

RUN apt-get update && apt-get upgrade -y

RUN apt-get update && apt-get install -y python3 python3-pip

RUN pip3 install flask

WORKDIR /opt/hackathon

COPY aplication_flask.py /opt/hackathon

ENV FLASK_APP=aplication_flask

ENV FLASK_RUN_HOST=0.0.0.0

WORKDIR /opt/hackathon

CMD ["flask", "run"]