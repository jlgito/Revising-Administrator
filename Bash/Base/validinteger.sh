#!/bin/bash

echo " Can i read your input "
read variable

case ${variable#[-+]} in

	*[!0-9] | '') echo "Not an integer" ;;
	* ) echo "Valid integer";;
esac
