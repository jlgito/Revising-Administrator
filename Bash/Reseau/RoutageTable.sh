#!/bin/bash
#Show my own routage table 
ip route show
#add new entry to my own routage table 
ip route add 192.168.1.0/24 dev eth0
