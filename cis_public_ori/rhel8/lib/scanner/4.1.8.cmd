a=$(auditctl -l | grep -e "\-a always,exit \-F arch=b64 \-S sethostname,setdomainname \-F key=system-locale" && \
auditctl -l | grep -e "\-a always,exit \-F arch=b32 \-S sethostname,setdomainname \-F key=system-locale" && \
auditctl -l | grep -e "\-w /etc/issue \-p wa \-k system-locale" && \
auditctl -l | grep -e "\-w /etc/issue.net \-p wa \-k system-locale" && \
auditctl -l | grep -e "\-w /etc/hosts \-p wa \-k system-locale" && \
auditctl -l | grep -e "\-w /etc/sysconfig/network \-p wa \-k system-locale")

echo $a