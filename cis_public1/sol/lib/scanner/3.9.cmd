a=$(ipadm show-prop -p _respond_to_timestamp -co current ip)

b=$(ipadm show-prop -p _respond_to_timestamp -co persistent ip)

echo $a $b