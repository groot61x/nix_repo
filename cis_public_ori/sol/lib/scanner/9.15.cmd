# Only uucp and nuucp should generate errors (as their home directories do not exist). 
# Other entries should be verified for correctness

logins -xo | awk -F: '($8 == "PS") { print }' | while read line; do
  user=`echo ${line} | awk -F: '{ print $1 }'`
  home=`echo ${line} | awk -F: '{ print $6 }'`
  find ${home} -type d -prune \! -user ${user} -ls
done