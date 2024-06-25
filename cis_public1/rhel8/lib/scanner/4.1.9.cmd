a=$(auditctl -l | grep -e "\-a always,exit \-F arch=b64 \-S chmod,fchmod,fchmodat \-F auid>=1000 \-F auid!=-1 \-F key=perm_mod" && \
auditctl -l | grep -e "\-a always,exit \-F arch=b32 \-S chmod,fchmod,fchmodat \-F auid>=1000 \-F auid!=-1 \-F key=perm_mod" && \
auditctl -l | grep -e "\-a always,exit \-F arch=b64 \-S chown,fchown,lchown,fchownat \-F auid>=1000 \-F auid!=-1 \-F key=perm_mod" && \
auditctl -l | grep -e "\-a always,exit \-F arch=b32 \-S lchown,fchown,chown,fchownat \-F auid>=1000 \-F auid!=-1 \-F key=perm_mod" && \
auditctl -l | grep -e "\-a always,exit \-F arch=b64 \-S setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr \-F auid>=1000 \-F auid!=-1 \-F key=perm_mod" && \
auditctl -l | grep -e "\-a always,exit \-F arch=b32 \-S setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr \-F auid>=1000 \-F auid!=-1 \-F key=perm_mod")

echo $a







