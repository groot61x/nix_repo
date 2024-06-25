a=$(grep -E '^PASS_WARN_AGE' /etc/login.defs | awk '{print $2}')

if [ $a -ge 7 ]; then
  echo "PASSED: (more than min 7)"
else
  echo "FAILED: (less than min 7)" 
fi 