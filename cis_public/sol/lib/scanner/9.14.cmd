logins -xo | while read line; do
  user=`echo ${line} | awk -F: '{ print $1 }'`
  home=`echo ${line} | awk -F: '{ print $6 }'`
  if [ -z "${home}" ]; then
    echo ${user}
  fi
done
