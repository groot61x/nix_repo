for usr in $(cut -d: -f1 /etc/shadow | grep -vE 'root|rootbkup' ); 
do 
  if [[ $(chage --list $usr | grep '^Last password change' | cut -d: -f2) > $(date) ]]; then 
    #echo "$usr :$(chage --list $usr | grep '^Last password change' | cut -d: -f2)"; 
		date1=$(chage --list $usr | grep '^Last password change' | cut -d: -f2)
		date1_epoch=$(date -d "$date1" +"%s")
		today__epoch=$(date -d today +"%s")
		if [[ $date1_epoch -gt $today__epoch ]];then
			echo "$usr :$(chage --list $usr | grep '^Last password change' | cut -d: -f2)"; 
		fi	
  fi
done
