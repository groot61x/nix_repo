a=$(useradd -D | xargs -n 1 | grep inactive | awk -F= '{ print $2 }')

echo $a

users=$(gawk -F: -v start_from=$start_uid '($3>=1000 && $3<=60000) || $3==0 {print $1}' /etc/passwd | sort )
for i in $users;do
  b=$(logins -axo -l "$i" | awk -F: '{ print $13 }' | grep -v 35)
  echo $i $b
done

