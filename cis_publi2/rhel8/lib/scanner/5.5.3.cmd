
## original code 
# #!/bin/bash
# 
# output1="" output2=""
# [ -f /etc/bashrc ] && BRC="/etc/bashrc"
# for f in "$BRC" /etc/profile /etc/profile.d/*.sh ; do
#    grep -Pq '^\s*([^#]+\s+)?TMOUT=(900|[1-8][0-9][0-9]|[1-9][0-9]|[1-9])\b' "$f" && grep -Pq '^\s*([^#]+;\s*)?readonly\s+TMOUT(\s+|\s*;|\s*$|=(900|[1-8][0-9][0-9]|[1-9][0-9]|[1-9]))\b' "$f" && grep -Pq '^\s*([^#]+;\s*)?export\s+TMOUT(\s+|\s*;|\s*$|=(900|[1-8][0-9][0-9]|[1-9][0-9]|[1-9]))\b' "$f" && output1="$f"
# done
# grep -Pq '^\s*([^#]+\s+)?TMOUT=(9[0-9][1-9]|9[1-9][0-9]|0+|[1-9]\d{3,})\b' /etc/profile /etc/profile.d/*.sh "$BRC" && output2=$(grep -Ps '^\s*([^#]+\s+)?TMOUT=(9[0-9][1-9]|9[1-9][0-9]|0+|[1-9]\d{3,})\b' /etc/profile /etc/profile.d/*.sh $BRC)
# if [ -n "$output1" ] && [ -z "$output2" ]; then
#    echo -e "\nPASSED\n\nTMOUT is configured in: \"$output1\"\n"
# else
#    [ -z "$output1" ] && echo -e "\nFAILED\n\nTMOUT is not configured\n"
#    [ -n "$output2" ] && echo -e "\nFAILED\n\nTMOUT is incorrectly configured in: \"$output2\"\n"
# fi


p=$(grep -E '^TMOUT' /etc/profile | awk -F= '{print $2}')
if [ $p -le 900 ]; then
	p_out="PASSED: TMOUT value in /etc/profile is $p (less than 900)"
else		
  p_out="FAILED: TMOUT value in /etc/profile value is $p (more than 900)"
fi

b=$(grep -E '^TMOUT' /etc/bashrc | awk -F= '{print $2}')
if [ $b -le 900 ]; then
	b_out="PASSED: TMOUT value in /etc/bashrc is $p (less than 900)"
else		
  b_out="PASSED: TMOUT value in /etc/bashrc is $p (less than 900)"
fi

d=$(grep -E '^TMOUT' /etc/profile.d/* | awk -F= '{print $2}')
if [ -z $d ];then 
	d_out="PASSED: TMOUT is not found in /etc/profile.d/"
else
	if [ $d -le 900 ]; then
		d_out="PASSED: On of the file in /etc/profile.d/* has TMOUT=$b (less than 900)"
	else		
		d_out="FAILED: On of the file in /etc/profile.d/* has TMOUT=$b (more than 900)"
	fi	
fi

echo $p_out $b_out $d_out