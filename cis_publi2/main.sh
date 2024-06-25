#!/bin/bash


function usage {
 echo "Usage: $0 [-x scan|remd ]"
 echo -e "\t$0 -x scan ==> for scanning only"
 echo -e "\t$0 -x remd ==> for scanning + remediation"	
 echo -e "\t$0 -h help"
 exit 1
}

while getopts x:h flag
do
    case "${flag}" in
        x) action=${OPTARG};;
        h) help=true ;;
        *) usage ;;
    esac
done

if [ $# -lt 1 ]; then
	usage
fi



if [ "$help" = true ];then
	echo "helppppppp !!!!!!!!!!!!!"
	sleep 1;
	echo "ha ha ha"
	exit 1
fi

#if [[ "$action" == "remd" ]];then
#	read -t 30 -p "Are you sure you want to proceed with remediation? (y/n): " choice
#	case "$choice" in
#	 [yY] ) return 0 ;;
#	 
#	 [nN] ) exit;;
#	 
#	 * ) usage ;;	
#	esac	
#fi

######## Main dir ##############
root_dir="/root/cis2"
output_dir="$root_dir/output"
date_time=$(date +'%Y-%m-%d_%H-%M')

######## FOR RHEL8 #########
if [[ `uname -s` == 'Linux' ]];
then 
	main_dir="$root_dir/rhel8"
	file_conf="$main_dir/all.conf"
	file_remd="$main_dir/remd"
######## FOR SOL   #########	
elif [[ `uname -s` == 'SunOS' ]];
then
	main_dir="$root_dir/sol"
	file_conf="$main_dir/all.conf"
	file_remd="$main_dir/remd"
fi


usage() {
	echo -e "Usage: bash $0 [-x action] [-h]"
	echo -e "	-x   	Specify the action:" 
	echo -e "				scan: to generate hardeing report"
	echo -e "				remd: to run hardening and generate report"
	echo -e "	-h 		Display help"			
	
}



output_tbl_failed="$output_dir/cis_`hostname`_failed.html"
output_tbl_passed="$output_dir/cis_`hostname`_passed.html"
output_tbl_manual="$output_dir/cis_`hostname`_manual.html"
output_tbl_fixed="$output_dir/cis_`hostname`_fixed.html"
output_hist_fix="$output_dir/cis_`hostname`.hist.txt"
output_html="$output_dir/cis_`hostname`.html"

#########################################

hostname=`hostname`
count_p=0	# counter PASSED
count_m=0	# counter MANUAL_CHECK
count_f=0	# counter FAILED
count_k=0	# counter FIXED

Red='\033[0;31m'
Green='\033[0;32m'

echo "Action : $action"

#################### start of init #############
function init_report {
	if [ ! -d "$main_dir" ];
	then 
		mkdir -p "$main_dir"
	fi	
	
	if [ ! -d "$output_dir" ];
	then 
		mkdir -p "$output_dir"
	fi	
	
	touch $output_tbl_failed
	>$output_tbl_failed
	touch $output_tbl_passed
	>$output_tbl_passed
	touch $output_tbl_manual
	>$output_tbl_manual
	touch $output_tbl_fixed
	>$output_tbl_fixed
	touch $output_html
	>$output_html
	touch $output_hist_fix
	
}
#################### end of init   #############

#################### start of report_output_destination   #############
## output: $result
function report_output_destination {
	# output destination
	if [[ $result == "FAILED" ]];then
		report_html=$output_tbl_failed
	elif [[ $result == "PASSED" ]];then
		report_html=$output_tbl_passed
	elif [[ $result == "MANUAL_CHECK" ]];then
		report_html=$output_tbl_manual
	elif [[ $result == "FIXED" ]];then
		report_html=$output_tbl_fixed
	fi	
}

function report_output_header {
## HTML Header 
	echo "<style>table, tr,td {border: 1px solid black; border-collapse: collapse; } </style>" |  tee -a $output_html > /dev/null
	echo -e "<h1>Hostname: `hostname`</h1>" | tee -a $output_html > /dev/null
	echo -e "<h1>Date: `date +"%d/%m/%Y %T"`</h1>" | tee -a $output_html > /dev/null
	echo -e "========================================" | tee -a $output_html > /dev/null
		
	echo -e "<h1>Results: FAILED</h1><table border=1>"| tee -a $output_tbl_failed > /dev/null
	echo -e  "<tr bgcolor="red" style="color:white"><td>No</td><td>Policy ID</td><td>Description</td><td>Result</td><td>Scanning Script</td><td>Exptected Configuration</td><td>Observerd Configuration</td><td>Hostname</td></tr>" | tee -a $output_tbl_failed > /dev/null
	
	echo -e "<h1>Results: PASSED</h1><table border=1>"| tee -a $output_tbl_passed > /dev/null
	echo -e  "<tr bgcolor="green" style="color:white"><td>No</td><td>Policy ID</td><td>Description</td><td>Result</td><td>Scanning Script</td><td>Exptected Configuration</td><td>Observerd Configuration</td><td>Hostname</td></tr>" | tee -a $output_tbl_passed > /dev/null
	
	echo -e "<h1>Results: MANUAL CHECK</h1><table border=1>"| tee -a $output_tbl_manual > /dev/null
	echo -e  "<tr bgcolor="yellow"><td>No</td><td>Policy ID</td><td>Description</td><td>Result</td><td>Scanning Script</td><td>Exptected Configuration</td><td>Observerd Configuration</td><td>Hostname</td></tr>" | tee -a $output_tbl_manual > /dev/null	
	
	echo -e "<h1>Results: FIXED</h1><table border=1>"| tee -a $output_tbl_fixed > /dev/null
	echo -e  "<tr bgcolor="#003366" style="color:white"><td>No</td><td>Policy ID</td><td>Description</td><td>Result</td><td>Remediation Script</td><td>Exptected Configuration</td><td>Observerd Configuration (Before)</td><td>Observerd Configuration (After)</td><td>Hostname</td></tr>" | tee -a $output_tbl_fixed > /dev/null
	

	#printf ""Policy ID","Result","Description","Hostname""  	
	
}	

function report_output_content {	
	# output content
	if [[ $result == "FIXED" ]];then
		echo -e "<tr>" tee -a $report_html > /dev/null
		echo -e "<td>$count</td>"	| tee -a $report_html > /dev/null
		echo -e "<td>$lib</td>"	| tee -a $report_html > /dev/null
		echo -e "<td>$desc</td>"	| tee -a $report_html > /dev/null
		echo -e "<td>$result</td>"	| tee -a $report_html > /dev/null
		echo -e "<td><pre>$(cat $f_remd)</pre></td>"	| tee -a $report_html > /dev/null
		
		if [[ "$expected" == "no output" ]];then expected="&ltNo output&gt";fi
		echo -e "<td>"$expected"</td>"	| tee -a $report_html > /dev/null
		# before 
		echo -e "<td width="200px">$observd_before</td>"	| tee -a $report_html > /dev/null
		# after
		echo -e "<td width="200px">$observd_after</td>"	| tee -a $report_html > /dev/null
		
		echo -e "<td>$hostname</td>" | tee -a $report_html > /dev/null
		echo -e "</tr>" | tee -a $report_html > /dev/null	
	else
		echo -e "<tr>" tee -a $report_html > /dev/null
		echo -e "<td>$count</td>"	| tee -a $report_html > /dev/null
		echo -e "<td>$lib</td>"	| tee -a $report_html > /dev/null
		echo -e "<td>$desc</td>"	| tee -a $report_html > /dev/null
		echo -e "<td>$result</td>"	| tee -a $report_html > /dev/null
		echo -e "<td><pre>$(cat $f_cmd)</pre></td>"	| tee -a $report_html > /dev/null
		
		if [[ "$expected" == "no output" ]];then expected="&ltNo output&gt";fi
		echo -e "<td>"$expected"</td>"	| tee -a $report_html > /dev/null
		if [ "$cmd_out" == "no output" ];then cmd_out="&ltNo output&gt";fi
		echo -e "<td width="200px">$cmd_out</td>"	| tee -a $report_html > /dev/null
		echo -e "<td>$hostname</td>" | tee -a $report_html > /dev/null
		echo -e "</tr>" | tee -a $report_html > /dev/null		
	fi
}



## Output: cmd_out
function run_scan {
	local l_cmd="${1}"
	if [[ -f $l_cmd ]];then
		cmd_out="$(sh $l_cmd  2>&1 | sed 's/\\n/ /g')" 
		# cmd_out="$(echo $cmd_out)"
		if [[ $( echo "$cmd_out" | tr -d ' ' | wc -m) -eq 1 ]];then cmd_out="no output";fi 
	else
		echo "$l_cmd not found!" 			
	fi	
}

## function trim string
function trimmed_string {
	local trimmed=$(echo "${1}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' )
	echo "${trimmed}"	
}

## Output: result, expected
function scan_result {		
		
		# check manual_check
		if [ "$manual_check" == "false" ];then 		
			if [[ "$cmd_out"  == *"$(trimmed_string "${expected1}" )"* ]];then	
					result="PASSED" 
					expected="$expected1"
					#p=$((p+1))
			else
				if [ "$(trimmed_string "${expected2}" )" != "" ];then	
					if [[ "$cmd_out"  == *"$(trimmed_string "${expected2}" )"* ]];then
						result="PASSED"
						expected="$expected1 or $expected2"
						#p=$((p+1))
					else
						if [ "$(trimmed_string "${expected3}" )" != ""  ];then	
							if [[ "$cmd_out"  == *"$(trimmed_string "${expected3}" )"* ]];then
								result="PASSED"
								expected="$expected1 or $expected2 or $expected3"
								#p=$((p+1))
								echo "here"
							else
								result="FAILED"  
								expected="$expected1 or $expected2  or $expected3"
								#f=$((f+1))
								echo "dafd"
							fi
						else 
							result="FAILED"  
							expected="$expected1 or $expected2"
							#f=$((f+1))
							echo "blah"
						fi	
					fi
				else 
					result="FAILED"  
					expected="$expected1"
					#f=$((f+1))
				fi	
			fi  
		else
			result="MANUAL_CHECK" 
			expected="$expected1"
			#m=$((m+1))
		fi	

}

## Output: fix_out
function run_remd {
	local l_remd="${1}"
	if [[ -f $l_remd ]];then
		fix_out="$(sh $l_remd  2>&1 | sed 's/\\n/ /g')" 		
	else
		echo "${l_remd} not found!" 			
	fi	

}






################# start initiation
init_report
report_output_header


################# START OF MAIN #################

while read -r lib || [ -n "$lib" ]
do
	[[ "$lib" =~ ^#.*$ || "$lib" =~ ^$ ]] && continue
		desc=""
		cmd=""
		expected=""
		expected1=""
		expected2=""
		expected3=""
		result=""
		
		f_policy="$main_dir/lib/scanner/$lib.conf"
		f_cmd="$main_dir/lib/scanner/$lib.cmd"
		f_remd="$main_dir/lib/remd/$lib.remd"
		
	# start check policy conf 
	if [[ -f "$f_policy" ]];then
		while read -r conf || [ -n "$conf" ]
		do
		[[ "$conf" =~ ^#.*$ || "$conf" =~ ^$ ]] && continue
			desc=$(awk -F ":::" '/description/ {print $2}' $f_policy)
			expected1=$(awk -F ":::" '/expected1/ {print $2}' $f_policy)
			expected2=$(awk -F ":::" '/expected2/ {print $2}' $f_policy)
			expected3=$(awk -F ":::" '/expected3/ {print $2}' $f_policy)
			manual_check=$(awk -F ":::" '/manual_check/ {print $2}' $f_policy)
			# if [ "$expected1" == "no output" ];then expected1="";fi 
			#if [ "$expected2" == "no output" ];then expected2="";fi 
 
		done < "$f_policy"
    

		# if remediation
		if [[ $action == "remd" ]];then
			run_scan $f_cmd
			scan_result
			observd_before="$cmd_out"
			result_before=$result
			
			if [[ $result_before == 'FAILED' ]];then
				if [[ -f "$f_remd" ]];then
					echo "=========================================================================================" >> $output_hist_fix
					echo "$hostname: $date_time" >> $output_hist_fix
					printf "Before: %s,%s,%s,%s,%s\n"  "\"$date_time\"" "\"$lib\""  "\"$desc\"" "\"$hostname\"" "\"$result\"" >> $output_hist_fix 
					echo "Remd script :" >> $output_hist_fix 
					# 	
					echo "----------" >> $output_hist_fix 
					cat $f_remd >> $output_hist_fix 
					echo "----------"	>> $output_hist_fix 	
					
					run_remd $f_remd
					run_scan $f_cmd
					scan_result
					observd_after="$cmd_out"
					result_after=$result
					if [[ $result_after == 'PASSED' ]];then
						result="FIXED"
						count_k=$((count_k+1))
						count=$count_k		
						report_output_destination
						report_output_content	
					fi	
					printf "After: %s,%s,%s,%s,%s\n"  "\"$date_time\"" "\"$lib\""  "\"$desc\"" "\"$hostname\"" "\"$result\"" >> $output_hist_fix 					
					echo "" >> $output_hist_fix 
				fi
			fi							
		fi


		run_scan $f_cmd
		scan_result		
		# count result
		if [[ $result == "FAILED" ]];then
			count_f=$((count_f+1))
			count=$count_f
		elif [[ $result == "PASSED" ]];then
			count_p=$((count_p+1))
			count=$count_p
		elif [[ $result == "MANUAL_CHECK" ]];then
			count_m=$((count_m+1))
			count=$count_m
		fi	
		
		report_output_destination
		report_output_content	
		printf "%s,%s,%s,%s\n" "\"$lib\""  "\"$desc\"" "\"$hostname\"" "\"$result\"" 	
      


#      printf "%s,%s,%s,%s\n" "\"$lib\""  "\"$desc\"" "\"$hostname\"" "\"$result\""  	
      
      # echo -e "\n\n#######################################################" | tee -a $output_raw > /dev/null
      # echo -e "<td>$lib</td>" | tee -a $output_raw > /dev/null
      # echo -e "Result \t\t\t\t: $result" | tee -a $output_raw > /dev/null
      # echo -e "Description \t\t: $desc" | tee -a $output_raw > /dev/null
      # echo -e "Expected Output \t\t: $expected" | tee -a $output_raw > /dev/null    
      # echo -e "Observed Configuration :\n$cmd_out" | tee -a $output_raw > /dev/null
      
    

  
   
    
	else
		echo "$f_policy not found!"   
    
	fi
	# end check policy conf
  
  
done < "$file_conf"
################# END OF MAIN	#################	

echo -e "</table><br><br>" | tee -a $output_tbl_fixed > /dev/null 
echo -e "</table><br><br>" | tee -a $output_tbl_failed > /dev/null 
echo -e "</table><br><br>" | tee -a $output_tbl_passed > /dev/null 
echo -e "</table><br><br>" | tee -a $output_tbl_manual > /dev/null 


cat $output_tbl_failed $output_tbl_manual $output_tbl_passed  >> $output_html


