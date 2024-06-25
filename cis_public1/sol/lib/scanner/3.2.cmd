a=$(ipadm show-prop -p _respond_to_address_mask_broadcast -co current ip)

b=$(ipadm show-prop -p _respond_to_address_mask_broadcast -co persistent ip)

echo $a $b