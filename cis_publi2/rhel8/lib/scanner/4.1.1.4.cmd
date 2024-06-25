v=$(auditctl -s | grep backlog_limit | awk '{print $2}')

if [[ $v -ge 8192 ]]; then
 echo -e "PASSED: Current value is $v.";
else
 echo -e "FAILED: Current value is $v."; 
fi 