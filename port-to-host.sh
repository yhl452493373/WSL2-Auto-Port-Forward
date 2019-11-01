#!/bin/bash
if [ ! -d /etc/nginx/port-to-host  ];then
	  mkdir -p /etc/nginx/port-to-host
fi	  
touch /etc/nginx/port-to-host/127.0.0.1-$1-to-$2-$3
cat <<EOF > /etc/nginx/port-to-host/127.0.0.1-$1-to-$2-$3
server {
    listen $1;
    server_name localhost;
    location / {
        proxy_pass http://$2:$3;
         proxy_read_timeout 300s;
         proxy_send_timeout 300s;
         proxy_set_header Host \$host;
         proxy_set_header X-Real-IP \$remote_addr;
         proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
         proxy_http_version 1.1;
         proxy_set_header Upgrade \$http_upgrade;
         proxy_set_header Connection 'upgrade';
    }
}
EOF
