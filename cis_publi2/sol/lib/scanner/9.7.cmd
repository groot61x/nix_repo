a=$(logins -o | awk -F: '($2 == 0) { print $1 }' | sort | xargs)

echo "${a}"