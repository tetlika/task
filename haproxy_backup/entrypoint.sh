#!/bin/bash 

/opt/wait.sh -h consul -p 8500
while [ $? -ne 0 ]; do
    sleep 5
    /opt/wait.sh -h consul -p 8500
done
#wait while primary haproxy will settle
while [ $? -ne 0 ]; do
    sleep 15
    /opt/wait.sh -h haproxy -p 80
done

#lets wait when primary haproxy will fail and failover afterwards
while [ $? -eq 0 ]; do
  sleep 15
  /opt/wait.sh -h haproxy -p 80
done

#lets take over main haproxy
consul-template -consul-addr consul:8500 -template "/opt/haproxy.conf.template:/etc/haproxy/haproxy.cfg" --once 
/etc/init.d/haproxy start 

consul-template -consul-addr consul:8500 -template "/opt/haproxy.conf.template:/etc/haproxy/haproxy.cfg:/etc/init.d/haproxy reload"


exit 0
