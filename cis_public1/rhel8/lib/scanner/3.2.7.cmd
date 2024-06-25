a="$(sysctl net.ipv4.conf.all.rp_filter)"

b="$(sysctl net.ipv4.conf.default.rp_filter)"

echo $a $b
