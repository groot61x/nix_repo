for dir in `logins -ox | awk -F: '($8 == "PS") { print $6 }'`; do
  ls -l ${dir}/.netrc 2>/dev/null
done