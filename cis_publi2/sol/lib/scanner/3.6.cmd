a=$(ipadm show-prop -p _forward_directed_broadcasts -co current ip)

b=$(ipadm show-prop -p _forward_directed_broadcasts -co persistent ip)

echo $a $b