a=$(grep "^MaxAuthTries" /etc/ssh/sshd_config | awk '{print $1 " " $2}')

echo "$a"