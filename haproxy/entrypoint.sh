#!/bin/bash 

/opt/wait.sh -h consul -p 8500
while [ $? -ne 0 ]; do
    sleep 5
    /opt/wait.sh -h consul -p 8500
done

consul-template -consul-addr consul:8500 -template "/opt/haproxy.conf.template:/etc/haproxy/haproxy.cfg" --once 
/etc/init.d/haproxy start 

consul-template -consul-addr consul:8500 -template "/opt/haproxy.conf.template:/etc/haproxy/haproxy.cfg:/etc/init.d/haproxy reload"


exit 0
