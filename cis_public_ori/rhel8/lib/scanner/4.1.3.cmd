a=$(auditctl -l | grep -e "\-w /etc/sudoers \-p wa \-k scope" && \
auditctl -l | grep "\-w /etc/sudoers.d \-p wa \-k scope")
echo $a
