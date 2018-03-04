FROM ubuntu:16.04
RUN apt-get update; apt-get -y install software-properties-common; add-apt-repository -y ppa:vbernat/haproxy-1.7; apt-get update; apt-get -y install haproxy
COPY haproxy.cfg /etc/haproxy/haproxy.cfg
CMD haproxy -f /etc/haproxy/haproxy.cfg
