{{ cfssl_bin }} gencert -initca json_file/ca-csr.json | {{ cfssl_json_bin }} -bare ca -
{{ cfssl_bin }} gencert -ca=ca.pem -ca-key=ca-key.pem -config=json_file/ca-config.json -profile=kubernetes json_file/server-csr.json | {{ cfssl_json_bin }} -bare server
{{ cfssl_bin }} gencert -ca=ca.pem -ca-key=ca-key.pem -config=json_file/ca-config.json -profile=kubernetes json_file/admin-csr.json | {{ cfssl_json_bin }} -bare admin
{{ cfssl_bin }} gencert -ca=ca.pem -ca-key=ca-key.pem -config=json_file/ca-config.json -profile=kubernetes json_file/kube-proxy-csr.json | {{ cfssl_json_bin }} -bare kube-proxy
{{ cfssl_bin }} gencert -ca=ca.pem -ca-key=ca-key.pem -config=json_file/ca-config.json -profile=kubernetes json_file/kube-controller-manager-csr.json | {{ cfssl_json_bin }} -bare kube-controller-manager
{{ cfssl_bin }} gencert -ca=ca.pem -ca-key=ca-key.pem -config=json_file/ca-config.json -profile=kubernetes json_file/kube-scheduler-csr.json | {{ cfssl_json_bin }} -bare kube-scheduler
{% if ansible_distribution == 'Ubuntu' %}chown {{ exec_user }}.{{ exec_user }} *.pem{% endif %}