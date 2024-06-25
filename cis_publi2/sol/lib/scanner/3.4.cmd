a=$(ipadm show-prop -p _respond_to_timestamp_broadcast -co current ip)

b=$(ipadm show-prop -p _respond_to_timestamp_broadcast -co persistent ip)

echo $a $b