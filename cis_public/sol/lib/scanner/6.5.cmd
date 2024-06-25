a=$(egrep "auth|account" /etc/pam.d/gdm-autologin | grep -vc ^#)

echo $a