a=$(cat /etc/motd )

b=$(ls -l /etc/motd | awk '{print $1 $3}')

c=$(cat /etc/issue)

d=$(ls -l /etc/issue | awk '{print $1 $3}')

echo "cat /etc/motd:"
echo "$a" 
echo " "
echo "ls -l /etc/motd: $b" 
echo " "

echo "cat /etc/issue:"
echo "$c"
echo " "
echo "ls -l /etc/issue: $d"
echo " "