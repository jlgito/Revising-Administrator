# Connect
open sftp://user:password@example.com/ -hostkey="ssh-rsa 2048 xxxxxxxxxxx...="
# Change remote directory
cd /home/user
# Download file to the local directory d:\
get examplefile.txt d:\
# Disconnect
close
# Connect as a different user
open sftp://user2:password@example.com/
# Change the remote directory
cd /home/user2
# Upload the file to current working directory
put d:\examplefile.txt 
# Disconnect
close
# Exit WinSCP
exit
