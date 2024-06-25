a=$(auditctl -l | grep -i modules  | sort | tr  '
' ' ')

echo $a