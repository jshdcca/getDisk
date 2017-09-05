#!/bin/bash
# get / disk usage script - jshdcca@gmail.com
# read server pool
serverlist='server_list.txt'
servers=`cat $serverlist`
# today is..
date=`date +%Y-%m-%d`

# print header
echo -e "Servername \t\t Filesystem \t Size Used Avail Use% Mounted on" > diskReport"$date".txt

# reads the servers in server_list.txt | $servers
for server in $servers
  do
  # login
  kernel=`ssh user@${server} "df -h | grep -w "/""`
  # print out results
  echo -e "$server \t\t $kernel" >> diskReport"$date".txt 
done
