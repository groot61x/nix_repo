# original scripts: 
# awk -F: '($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $1!~/^\+/ && $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' && $7!="'"$(which nologin)"'" && $7!="/bin/false") {print}' /etc/passwd
# awk -F: '($1!="root" && $1!~/^\+/ && $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"') {print $1}' /etc/passwd | xargs -I '{}' passwd -S '{}' | awk '($2!="L" && $2!="LK") {print $1}'

# modified, because 
# $(which nologin) will return /usr/sbin/nologin instead of /sbin/nologin
# add rootbkup, admin_tenable, arkmgr
awk -F: '($1!="root" && $1!="rootbkup" && $1!="root_itsec" && $1!="admin_tenable" && $1!="arkmgr" && $1!="sync" && $1!="shutdown" && $1!="halt" && $1!~/^\+/ && $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' && $7!="'"/sbin/nologin"'" && $7!="/bin/false") {print}' /etc/passwd

awk -F: '($1!="root" && $1!="rootbkup" && $1!="root_itsec" && $1!="admin_tenable" && $1!="arkmgr" && $1!~/^\+/ && $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"') {print $1}' /etc/passwd | xargs -I '{}' passwd -S '{}' | awk '($2!="L" && $2!="LK") {print $1}'

