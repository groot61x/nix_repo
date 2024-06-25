a="$(sysctl net.ipv4.conf.all.secure_redirects)"

b="$(sysctl net.ipv4.conf.default.secure_redirects)"

echo $a $b
