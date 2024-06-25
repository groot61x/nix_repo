a=$(ipadm show-prop -p send_redirects -co current ipv4)

b=$(ipadm show-prop -p send_redirects -co persistent ipv4)

c=$(ipadm show-prop -p send_redirects -co current ipv6)

d=$(ipadm show-prop -p send_redirects -co persistent ipv6)

echo $a $b $c $d