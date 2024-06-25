# grep "^\s*[^#]" /etc/audit/rules.d/*.rules | tail -1 | awk -F: '{print $2}'
a="$(grep "^\s*[^#]" /etc/audit/rules.d/*.rules | awk -F: '{print $2}' | grep "-e 2")"

echo "$a"