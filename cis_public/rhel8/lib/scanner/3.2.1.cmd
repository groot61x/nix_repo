a="$(sysctl net.ipv4.conf.all.accept_source_route)"

b="$(sysctl net.ipv4.conf.default.accept_source_route)"

echo $a $b
