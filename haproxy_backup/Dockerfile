FROM ubuntu:16.04
COPY entrypoint.sh /opt/
COPY wait.sh /opt

RUN apt-get update; apt-get install -y software-properties-common wget python3-pip python3 unzip; wget https://releases.hashicorp.com/consul-template/0.19.4/consul-template_0.19.4_linux_amd64.tgz && \
    add-apt-repository -y ppa:vbernat/haproxy-1.7; apt-get update; apt-get -y install haproxy && \
    tar -xvf consul-template_0.19.4_linux_amd64.tgz; mv consul-template /bin; chmod +x /opt/wait.sh; chmod +x /opt/entrypoint.sh; wget https://releases.hashicorp.com/consul/1.0.6/consul_1.0.6_linux_amd64.zip && \
    unzip consul_1.0.6_linux_amd64.zip; mv consul /bin/; pip3  install requests

COPY haproxy.conf.template /opt/haproxy.conf.template

CMD /opt/entrypoint.sh
