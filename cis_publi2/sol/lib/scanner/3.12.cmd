a=$(ipadm show-prop -p _strict_dst_multihoming -co current ipv4)

b=$(ipadm show-prop -p _strict_dst_multihoming -co persistent ipv4)

c=$(ipadm show-prop -p _strict_dst_multihoming -co current ipv6)

d=$(ipadm show-prop -p _strict_dst_multihoming -co persistent ipv6)

echo $a $b $c $d