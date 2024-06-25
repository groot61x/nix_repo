a=$(coreadm | tr -d '\t' | sed 's/^[ ]*//' | sort)

b=$(ls -ld /var/share/cores | awk '{print $1}')

echo $a $b