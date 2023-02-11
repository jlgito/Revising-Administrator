#!/bin/bash

variable=" "

while  [[ ! $variable =~ ^[0-9]{8} ]]; do
	echo Please unter your age
	read variable
done
