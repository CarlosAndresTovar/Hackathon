FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt-get update && apt-get install -y
RUN apt-get install openssh-server -y
RUN apt-get install tzdata 
RUN apt-get update && apt-get install -y python3 python3-pip
RUN apt-get install net-tools

RUN pip3 install flask

WORKDIR /opt/hackathon

COPY ./flask_aplication /opt/hackathon

WORKDIR /opt/hackathon

RUN mkdir /var/run/sshd

COPY launch.json /opt/hackathon/.vscode/launch.json

RUN echo 'root:root' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

RUN /etc/init.d/ssh start

WORKDIR /opt/hackathon

ENV FLASK_APP=aplication_flask.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_DEBUG=1

#CMD ["flask", "run"]
CMD ["/usr/sbin/sshd", "-D"]