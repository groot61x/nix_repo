check_ipv6=$(ip a s | grep inet6 | wc -l)

a="ipv6 is disabled"
b=""

if [ $check_ipv6 -ne "0" ];then
  a=$(sysctl net.ipv6.conf.all.accept_ra)
  b=$(sysctl net.ipv6.conf.default.accept_ra)
fi

echo $a $b
