a=$(netstat -an | grep LIST | grep ".25 " | grep "127.0.0.1.25" | awk '{print $1}')
b=$(netstat -an | grep LIST | grep ".587 " | grep "127.0.0.1.587" | awk '{print $1}')

echo "$a" "$b"