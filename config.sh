#!/usr/bin/bash
ifconfig wlan0 192.168.1.1 up;
echo "1" > /proc/sys/net/ipv4/ip_forward;
  iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT;
   iptables -A FORWARD -i eth0 -o wlan0 -m state --state ESTABLISHED,RELATED -j ACCEPT;
  iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE;
echo "done";

