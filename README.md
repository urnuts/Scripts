**常用脚本汇总：**

<code>**更新内核5.10并开启bbr_fq：**
```
wget --no-check-certificate https://raw.githubusercontent.com/urnuts/scripts/main/tcp.sh
chmod +x tcp.sh && ./tcp.sh
```
升级最新内核：```wget -O tcp.sh "https://git.io/coolspeeda/tcp.sh" && chmod +x tcp.sh && ./tcp.sh```

besttrace: TCP回程
```
wget --no-check-certificate https://raw.githubusercontent.com/urnuts/scripts/main/tcptrace.sh
chmod +x tcptrace.sh && ./tcptrace.sh
```
测试具体ip:
```
./besttrace -q1 -T -g cn ip
```

wget -N --no-check-certificate -q -O besttrace.sh "https://raw.githubusercontent.com/cchhuuaann1/besttrace/main/besttrace.sh" && chmod +x besttrace.sh && bash besttrace.sh




CloudFlare设置Dynamic DNS(DDNS)获取动态IP：
二级域名接入CF,添加ddns到任意ip 如1.1.1.1:

1）.CloudFlare解析ddns.example.com至任意ip,如1.1.1.1
2）.前往https://www.cloudflare.com/a/profile，复制Global API
3）.获取脚本：curl https://raw.githubusercontent.com/urnuts/scripts/main/cf-v4-ddns.sh > /root/cf-v4-ddns.sh && chmod +x ./cf-v4-ddns.sh
4）.编辑/root/cf-v4-ddns.sh,
   在下面4处手动填入自己的信息：Global API,cf账号邮箱，二级域名，ddns.二级域名
# incorrect api-key results in E_UNAUTH error
CFKEY=
# Username, eg: user@example.com
CFUSER=
# Zone name, eg: example.com
CFZONE_NAME=
# Hostname to update, eg: ddns.example.com
CFRECORD_NAME=

//或者命令修改信息：
sed -i 's/CFKEY=/CFKEY=c990020f4117297a917aed862924d5c/g' /root/cf-v4-ddns.sh
sed -i 's/CFUSER=/CFUSER=user@example.com/g' /root/cf-v4-ddns.sh
sed -i 's/CFZONE_NAME=/CFZONE_NAME=example.com/g' /root/cf-v4-ddns.sh
sed -i 's/CFRECORD_NAME=/CFRECORD_NAME=ddns.example.com/g' /root/cf-v4-ddns.sh

5）.运行：./cf-v4-ddns.sh
返回本机实际ip；进入cf查看，ddns.example.com对应的1.1.1.1已更新为实际ip

6）.添加crontab定时/重启执行任务：
设置定时任务为120s：*/2 * * * *  /usr/local/bin/cf-ddns.sh >/dev/null 2>&1
设置自启动：@reboot /root/cf-v4-ddns.sh

//重启Crontab：/etc/init.d/cron restart
//查看crontab定时执行任务列表：crontab -l
//添加crontab定时执行任务：crontab -e
