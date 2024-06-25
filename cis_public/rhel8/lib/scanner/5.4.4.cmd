a=$(grep -E '^\s*password\s+sufficient\s+pam_unix.so\s+.*sha512\s*.*$' /etc/pam.d/password-auth)
b=$(grep -E '^\s*password\s+sufficient\s+pam_unix.so\s+.*sha512\s*.*$' /etc/pam.d/system-auth)

echo $a
echo $b