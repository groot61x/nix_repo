a=$(routeadm -p | egrep "^ipv4-routing |^ipv4-forwarding " | awk '{printf("%s %s\n", $1, $NF); }' | sort)

b=$(routeadm -p | egrep "^ipv4-routing |^ipv4-forwarding " | awk '{printf("%s %s\n", $1, $2); }' | sort)

c=$(routeadm -p | egrep "^ipv6-routing |^ipv6-forwarding " | awk '{printf("%s %s\n", $1, $NF); }' | sort)

d=$(routeadm -p | egrep "^ipv6-routing |^ipv6-forwarding " | awk '{printf("%s %s\n", $1, $2); }' | sort)

echo $a $b $c $d