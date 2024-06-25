a=$(grep "^\*timeout:" /usr/share/X11/app-defaults/XScreenSaver)

b=$(grep "^\*lockTimeout:" /usr/share/X11/app-defaults/XScreenSaver)

c=$(grep "^\*lock:" /usr/share/X11/app-defaults/XScreenSaver)

echo $a $b $c