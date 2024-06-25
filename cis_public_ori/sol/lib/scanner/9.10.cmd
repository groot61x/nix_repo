for dir in `logins -ox | awk -F: '($8 == "PS") { print $6 }'`; do
  find ${dir}/.[A-Za-z0-9]* \! -type l \( -perm -20 -o -perm -02 \) -ls 
done