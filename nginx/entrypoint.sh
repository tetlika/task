#!/bin/bash 

/opt/wait.sh -h consul -p 8500
while [ $? -ne 0 ]; do
    sleep 5
    /opt/wait.sh -h consul -p 8500
done

consul-template -consul-addr consul:8500 -template "/opt/nginx.conf.template:/etc/nginx/nginx.conf" --once 
/etc/init.d/nginx start 
while [ $? -ne 0 ]; do 
    sleep 5
    consul-template -consul-addr consul:8500 -template "/opt/nginx.conf.template:/etc/nginx/nginx.conf" --once
    /etc/init.d/nginx start; 
done

consul-template -consul-addr consul:8500 -template "/opt/nginx.conf.template:/etc/nginx/nginx.conf:/etc/init.d/nginx reload"


exit 0
