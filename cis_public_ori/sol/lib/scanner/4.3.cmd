a=$(grep "cis" /etc/security/audit_event | awk -F: '{ print $2 }' | egrep 'AUE_CHMOD|AUE_CHOWN|AUE_FCHOWN|AUE_FCHMOD|AUE_LCHOWN|AUE_ACLSET|AUE_FACLSET' | sort)

echo $a