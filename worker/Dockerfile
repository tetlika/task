FROM ubuntu:16.04

COPY CurrencyService-0.1.0.jar /opt/
COPY entrypoint.sh /opt/
COPY wait.sh /opt

RUN apt-get update; apt-get -y install default-jre wget unzip && \
    wget https://releases.hashicorp.com/consul/1.0.6/consul_1.0.6_linux_amd64.zip && \
    unzip consul_1.0.6_linux_amd64.zip; mv consul /bin/ && \
    chmod +x /opt/entrypoint.sh; chmod +x /opt/wait.sh

CMD /opt/entrypoint.sh 
