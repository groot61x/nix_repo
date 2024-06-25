# Original: 
# grep -Ei '^\s*Defaults\s+(\[^#]+,\s*)?use_pty' /etc/sudoers /etc/sudoers.d/*

# Modified version
f=$(ls /etc/sudoers.d/ | wc -l)
if [ $f -gt 0 ];then
	grep -Ei '^\s*Defaults\s+(\[^#]+,\s*)?use_pty' /etc/sudoers /etc/sudoers.d/*
else
	grep -Ei '^\s*Defaults\s+(\[^#]+,\s*)?use_pty' /etc/sudoers
fi
