# grep -P '^\h*password\h+(requisite|sufficient)\h+(pam_pwhistory\.so|pam_unix\.so)\h+([^#\n\r]+\h+)?remember=([12-9]|[1-9][0-9]+)\h*(\h+.*)?$' /etc/pam.d/system-auth


cat /etc/pam.d/system-auth | grep "remember=12"