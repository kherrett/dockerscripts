#!/bin/bash

#If the agent name isn't defined, we'll choose a random one to avoid conflict
random=`echo $((1 + RANDOM % 1000))`

#Remove UUIDs to avoid conflicts
rm -f /etc/tenable_tag
rm -f /opt/nessus_agent/var/nessus/uuid

#Check if variables have been set during deployment
#If not, set some defaults to link to NC

if [ ! "$host" ]; then
	host="cloud.tenable.com"
fi

if [ ! "$key" ]; then
	key="00f0c52cf4d0cda7497932061ff7babd0b1529405bbcaca42f5bc65f64dae1775b"
fi

if [ ! "$port" ]; then
	port="443"
fi

if [ ! "$agent_name" ]; then
	agent_name="Acme Corp Agent $random"
fi

#This is for debugging. If the container is run itneractively, it will spit out the values.
echo "Host is set to $host"
echo "Port is set to $port"
echo "Key is set to $key"
echo "Agent name is set to $agent_name"

#Link the agent
/opt/nessus_agent/sbin/nessuscli agent link --host="$host" --key="$key" --port="$port" --name="""$agent_name"""
#Run the service
/opt/nessus_agent/sbin/nessus-service

