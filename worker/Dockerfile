FROM ubuntu:16.04

COPY entrypoint.sh /opt/
COPY wait.sh /opt
COPY CurrencyService /opt/CurrencyService

RUN apt-get update; apt-get -y install default-jre wget unzip openjdk-8-jdk && \
    wget https://releases.hashicorp.com/consul/1.0.6/consul_1.0.6_linux_amd64.zip && \
    unzip consul_1.0.6_linux_amd64.zip; mv consul /bin/ && \
    chmod +x /opt/entrypoint.sh; chmod +x /opt/wait.sh && \
    cd /opt/CurrencyService; chmod +x gradlew; ./gradlew build; 

CMD /opt/entrypoint.sh 
