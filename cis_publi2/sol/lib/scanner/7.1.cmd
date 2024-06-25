a=$(logins -ox | awk -F: '( $1 != "root" && $8 != "LK" && $8 != "NL" && ( $10 < 7 || $11 > 91 || $12 < 7 )) { print }')
# (No output should be returned.)

b=$(grep "WEEKS=" /etc/default/passwd | sort -u)
# Expected output: 
# MAXWEEKS=13
# MINWEEKS=1
# WARNWEEKS=2



echo $a $b