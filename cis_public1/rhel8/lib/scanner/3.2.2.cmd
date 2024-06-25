a="$(sysctl net.ipv4.conf.all.accept_redirects)"

b="$(sysctl net.ipv4.conf.default.accept_redirects)"

echo $a $b
