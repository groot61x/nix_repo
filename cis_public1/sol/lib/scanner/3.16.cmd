a=$(ipadm show-prop -p _conn_req_max_q -co current tcp)

b=$(ipadm show-prop -p _conn_req_max_q -co persistent tcp)

echo $a $b