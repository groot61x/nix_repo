a=$(grep "^RETRIES=" /etc/default/login)

b=$(grep "^LOCK_AFTER_RETRIES=" /etc/security/policy.conf)

echo "$a $b" 

users=$(gawk -F: -v start_from=$start_uid '($3>=1000 && $3<=60000) || $3==0 {print $1}' /etc/passwd | sort )
for i in $users;do a=$(userattr lock_after_retries $i);echo "$i $a" | grep -v root | grep -v "YES";done
