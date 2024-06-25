a=$(cat /etc/pam.conf | grep -v '^#' | grep "pam_rhosts_auth" | wc -l)

b=$(cat /etc/pam.d/* | grep -v '^#' | grep "pam_rhosts_auth" | wc -l)

echo "$a $b"