
a=$(find / -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk '{print "-a always,exit -F path=" $1 " \
-F perm=x -F auid>='"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' -F auid!=4294967295 \
-k privileged" }' | awk '{print $4}' | awk -F"=" '{print $2}' | sort)

for i in $a; do 
  auditctl -l | grep $i > /dev/null ; 
  if [ $? -gt 0 ]; then
    echo "FAILED! $i: use privilege command is not collected"
  fi
done