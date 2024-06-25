for dir in `logins -ox | awk -F: '($8 == "PS") { print $6 }'`; do
  find ${dir}/.netrc -type f \( -perm -g+r -o -perm -g+w -o -perm -g+x -o -perm -o+r -o -perm -o+w -o -perm -o+x \) -ls 2>/dev/null
done