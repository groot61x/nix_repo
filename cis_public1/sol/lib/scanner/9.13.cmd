a=$(logins -xo | awk -F: '($3 == "") { print $1 }')

echo "$a"