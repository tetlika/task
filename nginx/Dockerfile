FROM ubuntu:16.04
COPY nginx.conf.template /opt/
COPY entrypoint.sh /opt/
COPY wait.sh /opt
COPY healcheck.py /opt

RUN apt-get update; apt-get install -y nginx wget python3-pip python3 unzip; wget https://releases.hashicorp.com/consul-template/0.19.4/consul-template_0.19.4_linux_amd64.tgz && \
    tar -xvf consul-template_0.19.4_linux_amd64.tgz; mv consul-template /bin; chmod +x /opt/wait.sh; chmod +x /opt/entrypoint.sh; wget https://releases.hashicorp.com/consul/1.0.6/consul_1.0.6_linux_amd64.zip && \
    unzip consul_1.0.6_linux_amd64.zip; mv consul /bin/; pip3  install requests

CMD /opt/entrypoint.sh
