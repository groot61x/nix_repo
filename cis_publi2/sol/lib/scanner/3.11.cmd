a=$(ipadm show-prop -p _ignore_redirect -co current ipv4)

b=$(ipadm show-prop -p _ignore_redirect -co persistent ipv4)

c=$(ipadm show-prop -p _ignore_redirect -co current ipv6)

d=$(ipadm show-prop -p _ignore_redirect -co persistent ipv6)

echo $a $b $c $d