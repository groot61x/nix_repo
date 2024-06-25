for user in $(logins -s | awk '{ print $1 }'); do
  if [[ "${user}" != "root" ]] && [[ "$user" != "rootbkup" ]]; then 
    stat=`passwd -s ${user} | awk '{ print $2 }'`
    if [ "${stat}" != "LK" ] && [ "${stat}" != "NL" ]; then
     echo "Account ${user} is not locked or non-login."
    fi
  fi
done
