# original script:
# find /var/log/ -type f -perm /g+wx,o+rwx  -exec ls -l "{}" + 

# modified to exclude /var/log/btpm, lastlog, and wtmp because user should be able to read those logs when login

find /var/log/ -type f -perm /g+wx,o+rwx  -exec ls -l "{}" + | grep -vE "btmp|lastlog|wtmp|vmware"
