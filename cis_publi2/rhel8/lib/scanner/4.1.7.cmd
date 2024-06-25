a=$(auditctl -l | grep -e "\-w /etc/selinux \-p wa \-k MAC\-policy" && \
auditctl -l | grep -e "\-w /usr/share/selinux \-p wa \-k MAC\-policy")


echo $a