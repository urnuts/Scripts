    Debian 9/Ubuntu 17+添加rc.local开机自启的方法：
    https://www.moerats.com/archives/623/
    
     
    
  方法

1、添加rc-local.service

#以下为一整条命令，一起复制运行
cat > /etc/systemd/system/rc-local.service <<EOF
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
 
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
 
[Install]
WantedBy=multi-user.target
EOF

2、新建rc-local文件

#以下为一整条命令，一起复制运行
cat > /etc/rc.local <<EOF
#!/bin/sh
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.
 
exit 0
EOF

3、添加权限并设置开机自启

chmod +x /etc/rc.local
systemctl enable rc-local
systemctl start rc-local.service

检查状态：

systemctl status rc-local.service

返回Active:active信息，则成功。

最后我们就可以在/etc/rc.local里，添加开机的自启命令什么的了。记住添加在exit 0之前。

