#a=$(auditctl -l | grep -e "\-a always,exit \-F arch=b64 \-S rename,unlink,unlinkat,renameat \-F auid>=1000 \-F auid!=-1 \-F key#=delete" && \
#auditctl -l | grep -e "\-a always,exit \-F arch=b64 \-S rename,unlink,unlinkat,renameat \-F auid>=1000 \-F auid!=-1 \-F key=delete")

a=$(auditctl -l | grep key=delete)

echo $a