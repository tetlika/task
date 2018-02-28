#!/bin/bash 

java -jar /opt/CurrencyService-0.1.0.jar &

/opt/wait.sh -h localhost -p 8080 
while [ $? -ne 0 ]; do
    sleep 5
    /opt/wait.sh -h localhost -p 8080
done

/opt/wait.sh -h consul -p 8500
while [ $? -ne 0 ]; do
    sleep 5
    /opt/wait.sh -h consul -p 8500
done

consul kv put -http-addr=consul:8500 backends/${HOSTNAME}

wait

exit 0
