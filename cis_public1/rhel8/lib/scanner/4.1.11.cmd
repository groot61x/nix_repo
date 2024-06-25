a=$(auditctl -l | grep -e "\-w /etc/group \-p wa \-k identity" && \
auditctl -l | grep -e "\-w /etc/passwd \-p wa \-k identity" && \
auditctl -l | grep -e "\-w /etc/gshadow \-p wa \-k identity" && \
auditctl -l | grep -e "\-w /etc/shadow \-p wa \-k identity" && \
auditctl -l | grep -e "\-w /etc/security/opasswd \-p wa \-k identity")

echo $a
