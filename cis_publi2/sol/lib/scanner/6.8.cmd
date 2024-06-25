for user in `logins -s | awk '{ print $1 }'` aiuser noaccess nobody nobody4; do
  grep -w "${user}" /etc/ftpd/ftpusers >/dev/null 2>&1
  if [ $? != 0 ]; then
    echo "User '${user}' not in /etc/ftpd/ftpusers."
  fi
done