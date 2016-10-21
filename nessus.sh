#!/bin/bash
random=`echo $((1 + RANDOM % 1000))`
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

if [ ! "$scanner_name" ]; then
        scanner_name="Acme Corp Scanner $random"
fi


echo "Host is set to $host"
echo "Port is set to $port"
echo "Key is set to $key"
echo "Agent name is set to $scanner_name"

/opt/nessus_agent/sbin/nessuscli managed link --host="$host" --key="$key" --port="$port" --name="""$scanner_name"""

#/opt/nessus/sbin/nessuscli managed link --host=cloud.tenable.com --key=00f0c52cf4d0cda7497932061ff7babd0b1529405bbcaca42f5bc65f64dae1775b --port=443 --name="Acme Corp Internal $random"
/opt/nessus/sbin/nessus-service

