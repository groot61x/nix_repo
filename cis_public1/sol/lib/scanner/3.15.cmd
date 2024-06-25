a=$(ipadm show-prop -p _conn_req_max_q0 -co current tcp)

b=$(ipadm show-prop -p _conn_req_max_q0 -co persistent tcp)

echo $a $b