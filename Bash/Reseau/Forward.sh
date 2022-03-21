#!/bin/bash
#Verifier que le forward est bien aéctif ou non 
cat /proc/sys/net/ipv4/ip_forward
#Rendre actif et permanent le routage 
echo 1 > /proc/sys/net/ipv4/ip_forward
