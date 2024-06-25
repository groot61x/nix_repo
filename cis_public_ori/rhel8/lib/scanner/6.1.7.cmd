a=$(stat -L -c "%a" /etc/gshadow-)
b=$(stat -L -c "%u %g" /etc/gshadow-)

echo $a $b