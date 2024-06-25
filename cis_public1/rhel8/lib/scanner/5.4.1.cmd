SYSTEM_AUTH='/etc/pam.d/system-auth'
PWQUAL_CNF='/etc/security/pwquality.conf'

pwq=$(grep pam_pwquality.so ${SYSTEM_AUTH} | wc -l )
if [ $pwq -gt 0 ];then
  a="pwquality.so"
else
  a=""  
fi


b=$(grep 'minlen = 14' ${PWQUAL_CNF})
c=$(grep 'dcredit = -1' ${PWQUAL_CNF})
d=$(grep 'ucredit = -1' ${PWQUAL_CNF})
e=$(grep 'ocredit = -1' ${PWQUAL_CNF})
f=$(grep 'lcredit = -1' ${PWQUAL_CNF})
g=$(grep 'retry = 5' ${PWQUAL_CNF})

echo "$a $b $c $d $e $f $g"