a=$(ipadm show-prop -p _forward_src_routed -co current ipv4)

b=$(ipadm show-prop -p _forward_src_routed -co persistent ipv4)

c=$(ipadm show-prop -p _forward_src_routed -co current ipv6)

d=$(ipadm show-prop -p _forward_src_routed -co persistent ipv6)

echo $a $b $c $d