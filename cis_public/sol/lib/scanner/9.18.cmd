getent group | cut -f1 -d":" | sort -n | uniq -c | while read x ; do
  [ -z "${x}" ] && break
  set - $x
  if [ $1 -gt 1 ]; then
    gids=`getent group |\
    nawk -F: '($1 == n) { print $3 }' n=$2 | xargs`
    echo "Duplicate Group Name ($2): ${gids}"
 fi
done