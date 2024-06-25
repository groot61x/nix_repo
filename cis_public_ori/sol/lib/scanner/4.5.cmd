a=$(auditconfig -getcond | sort)

b=$(auditconfig -getpolicy | sort)

c=$(auditconfig -getflags | sort)

d=$(auditconfig -getnaflags | sort)

e=$(auditconfig -getplugin audit_binfile | sort | tr -d '\t')

f=$(userattr audit_flags root | sort)

g_date=$(ls -l --time-style long-iso /var/share/audit/*.not_terminated.* | awk '{print $6}')
g_size=$(ls -l /var/share/audit/*.not_terminated.* | awk '{print $5}')
today_date=$(date +'%Y-%m-%d')

if [[ "$g_date" == "$today_date" ]] && [[ $g_size -gt 0 ]] ;then
    g="OK"
else    
    g="NOK"
fi    

echo $a $b $c $d $e $f $g