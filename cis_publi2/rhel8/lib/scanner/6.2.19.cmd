a=$(awk -F: '($1=="shadow") {print $NF}' /etc/group)
b=$(awk -F: -v GID="$(awk -F: '($1=="shadow") {print $3}' /etc/group)" '($4==GID) {print $1}' /etc/passwd)

echo $a $b
