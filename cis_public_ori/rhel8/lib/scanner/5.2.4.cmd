for hostkey in /etc/ssh/ssh_host_*_key.pub; do 
  stat -c '%U:%G' $hostkey | grep -v "root:root"; 
  stat -L -c "%a" $hostkey | grep -v 644;
done

