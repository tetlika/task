# Requirements

Tested under docker-compose version 1.16.1. 
Docker version 17.09.0-ce.
Local port 80 not busy on local machine.

# General description of setup

This code spans up environment using docker-compose for orchestration. To spawn environment just run the run.sh script:

```
./run.sh <N>
```

Where "<N>" is number of workers you want to spawn, e.g. 3, 4, 1, etc ...

After launching environment you will get following containers:
```
1. consul - container used for internal registry of workers names
2. haproxy - active balancer to workers
3. haproxy_backup - idle balancer, which takes over traffic in case of failure of active balancer (haproxy)
4. haproxy_front - backbone balancer which has haproxy and haproxy_backup wired in the configuration 
5. worker - you can choose how much workers you will run, pottentially you can run as many workers as you want

```

# Implementation details in relation to tasks
## Task 1
See haproxy folder and worker folder for details.
## Task 2
As was already mentioned docker-compose is used for orchestration. See docker-compose.yml for details
## Task 3 
Healthcheck script is located in haproxy/healcheck.py file. To run it - login to the haproxy container and execute:

```
python3 /opt/healcheck.py
```
## Task 4
Source code of worker is located in worker/CurrencyService folder, and is already modified with 8 multiplier. Compilation happens when you run run.sh script.
See worker/Dockerfile for details.
## Task 5
Failover required in task happens automatically - see haproxy_backup/entrypoint.sh script for details. Backbone haproxy takes care of the rest job.

