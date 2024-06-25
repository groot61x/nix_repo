a=$(ipadm show-prop -p _rev_src_routes -co current tcp)

b=$(ipadm show-prop -p _rev_src_routes -co persistent tcp)

echo $a $b