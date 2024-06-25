for hostkey in /etc/ssh/ssh_host_*_key; do 
  stat -c '%U:%G' $hostkey | grep -v "root:ssh_keys"; 
  stat -L -c "%a" $hostkey | grep -v 640;
done

