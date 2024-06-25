a=$(poweradm list | grep suspend | awk '{print $1 " " $2 " " $3}')

echo "$a"