a=$(grep "^TCP_STRONG_ISS=" /etc/default/inetinit)

b=$(ipadm show-prop -p _strong_iss -co current tcp)

echo $a $b