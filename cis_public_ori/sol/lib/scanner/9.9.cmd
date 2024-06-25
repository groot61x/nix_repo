for dir in `logins -ox | awk -F: '($8 == "PS") { print $6 }'`; do
  find ${dir} -type d -prune \( -perm -g+w -o -perm -o+r -o -perm -o+w -o -perm -o+x \) -ls
done