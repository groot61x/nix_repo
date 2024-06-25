a=$(grep '\bmax_log_file\b' /etc/audit/auditd.conf | awk -F= '{print $2}' | tr -d ' ')

if [[ $a -ge 8 ]]; then
  echo "PASSED: log storage size is $a MB (min 8MB)"
else
  echo "FAILED: log storage size is $a MB (min 8MB)"  
fi