#!/bin/ba
#Unlink scanners and agents via 'exe'c to container , then shutdown the container 
for i in $(docker ps -q); do docker exec $i /opt/nessus/sbin/nessuscli managed unlink; done
for i in $(docker ps -q); do docker exec $i /opt/nessus_agent/sbin/nessuscli agent unlink; done

#Stop and remove the containers
for i in $(docker ps -q); do docker stop $i && docker rm $i; done
