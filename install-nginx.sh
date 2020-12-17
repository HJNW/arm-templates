#!/bin/bash

yum -y install epel-release 

yum -y install nginx

systemctl start nginx 

cat > /usr/share/nginx/html/index.html << EOF
<center>
<h1>Hello, CMP</h1>
<h2>Let's rock</h2>
</center>

EOF

