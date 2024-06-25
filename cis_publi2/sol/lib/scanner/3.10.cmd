a=$(ipadm show-prop -p _respond_to_echo_multicast -co current ipv4)

b=$(ipadm show-prop -p _respond_to_echo_multicast -co persistent ipv4)

echo $a $b