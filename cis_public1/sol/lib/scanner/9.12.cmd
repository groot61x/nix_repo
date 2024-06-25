for dir in `logins -ox | awk -F: '($8 == "PS") { print $6 }'`; do
  find ${dir}/.rhosts -type f -ls 2>/dev/null
done