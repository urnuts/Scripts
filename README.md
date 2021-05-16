常用脚本汇总：


更新内核并开启bbr_fq：

    wget  --no-check-certificate https://raw.githubusercontent.com/urnuts/scripts/main/tcp.sh
    chmod +x tcp.sh && ./tcp.sh
    
    //原版：wget -O tcp.sh "https://git.io/coolspeeda/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
    
    
besttrace: TCP回程
    
    wget --no-check-certificate https://raw.githubusercontent.com/urnuts/scripts/main/tcptrace.sh
    chmod +x tcptrace.sh && ./tcptrace.sh
    
    测试具体ip:./besttrace -q1 -T -g cn ip
    

    
Cloudflare DDNS配置：适合动态ip NAT/VPS
二级域名接入CF,添加ddns到任意ip 如1.1.1.1:

    curl https://raw.githubusercontent.com/urnuts/scripts/main/cf-v4-ddns.sh > /root/cf-v4-ddns.sh && chmod +x ./cf-v4-ddns.sh
    
    编辑/root/cf-v4-ddns.sh,手动填入自己的信息：
    # incorrect api-key results in E_UNAUTH error
    CFKEY=
    # Username, eg: user@example.com
    CFUSER=
    # Zone name, eg: example.com
    CFZONE_NAME=
    # Hostname to update, eg: ddns.example.com
    CFRECORD_NAME=

    或者命令修改信息：Global API,cf账号邮箱，二级域名，ddns.二级域名
    sed -i 's/CFKEY=/CFKEY=c990020f4117297a917aed862924d5c/g' /root/cf-v4-ddns.sh
    sed -i 's/CFUSER=/CFUSER=user@example.com/g' /root/cf-v4-ddns.sh
    sed -i 's/CFZONE_NAME=/CFZONE_NAME=example.com/g' /root/cf-v4-ddns.sh
    sed -i 's/CFRECORD_NAME=/CFRECORD_NAME=ddns.example.com/g' /root/cf-v4-ddns.sh

    运行：./cf-v4-ddns.sh
    返回本机实际ip,
    进入cf查看，ddns.example.com对应的1.1.1.1已更新为实际ip
    
    

