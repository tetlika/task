# Requirements

Tested under docker-compose version 1.16.1. 
Docker version 17.09.0-ce.
Local port 80 not busy on local machine.

# General description of setup

This code spans up environment using docker-compose for orchestration. To spawn environment just run the run.sh script:

```
./run.sh <N>
```

Where <N> is number of workers you want to spawn, e.g. 3, 4, 1, etc ...

After launching environment you will get followin containers:
```
1. consul - container used for internal registry of workers names
2. haproxy - active balancer to workers
3. haproxy_backup - idle balancer, which takes over traffic in case of failure of active balancer (haproxy)
4. haproxy_front - backbone balancer which has haproxy and haproxy_backup wired in the configuration 
5. worker - you can choose how much workers you will run, pottentially you can run as many workers as you want.

```
