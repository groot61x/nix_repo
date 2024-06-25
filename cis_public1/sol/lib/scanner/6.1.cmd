a=$(svcs -Ho state svc:/system/console-login:terma)

b=$(svcs -Ho state svc:/system/console-login:termb)

echo $a $b