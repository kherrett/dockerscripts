# dockerscripts

nessus.sh will configure a Nessus Scanner to connect to Nessus Cloud. 
Usage:
  
  docker run -e host=<host> port=<port> key=<key> scanner_name=<scanner_name> -d <image>
  
If default values are left, it will connect my Nessus Cloud account on port 443 with a random scanner name in the format 'Acme Corp Scanner [0-1000]'



nessus_agent.sh will configure a Nessus Agent to connect to Nessus Cloud. 
Usage:
  
  docker run -e host=<host> port=<port> key=<key> agent_name=<agent_name> -d <image>
  
If default values are left, it will connect my Nessus Cloud account on port 443 with a random agent name in the format 'Acme Corp Agent  [0-1000]'
