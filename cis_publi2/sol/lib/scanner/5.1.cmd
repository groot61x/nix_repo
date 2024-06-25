a=$(find / \( -fstype nfs -o -fstype cachefs -o -fstype autofs -o -fstype ctfs -o -fstype mntfs -o -fstype objfs -o -fstype proc \) -prune -o -type d \( -perm -0002 -a ! -perm -1000 \) -ls)

echo $a