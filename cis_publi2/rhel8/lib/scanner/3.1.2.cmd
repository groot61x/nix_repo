a="$(sysctl net.ipv4.conf.all.send_redirects)"

b="$(sysctl net.ipv4.conf.default.send_redirects)"

echo $a $b
