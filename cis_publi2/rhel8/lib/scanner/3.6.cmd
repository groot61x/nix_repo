#!/bin/bash

output=""
efidir=$(find /boot/efi/EFI/* -type d -not -name 'BOOT')
gbdir=$(find /boot -maxdepth 1 -type d -name 'grub*')

[ -f "$efidir"/grubenv ] && grubfile="$efidir/grubenv" || grubfile="$gbdir/grubenv"

! grep "^\s*kernelopts=" "$grubfile" | grep -vq ipv6.disable=1 && output="ipv6 disabled in grub config"

if grep -Eqs "^\s*net\.ipv6\.conf\.all\.disable_ipv6\s*=\s*1\b" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf && \
  grep -Eqs "^\s*net\.ipv6\.conf\.default\.disable_ipv6\s*=\s*1\b" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf && \
  sysctl net.ipv6.conf.all.disable_ipv6 | grep -Eq "^\s*net\.ipv6\.conf\.all\.disable_ipv6\s*=\s*1\b" && \
  sysctl net.ipv6.conf.default.disable_ipv6 | grep -Eq "^\s*net\.ipv6\.conf\.default\.disable_ipv6\s*=\s*1\b"; then
   [ -n "$output" ] && output="$output, and in sysctl config" || output="ipv6 disabled in sysctl config"
fi

[ -n "$output" ] && echo -e "\n\n$output\n" || echo -e  "\n\nIPv6 is enabled on the system\n"
