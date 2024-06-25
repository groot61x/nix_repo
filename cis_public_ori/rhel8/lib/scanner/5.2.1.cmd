a=$(stat -L -c "%a" /etc/ssh/sshd_config)
b=$(stat -L -c "%u %g" /etc/ssh/sshd_config)

echo $a $b