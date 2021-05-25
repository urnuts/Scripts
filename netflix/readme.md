  
  
  一. 安装netflix-proxy
    
    ubuntu 18/20，无需更新内核，直接安装成功；
    多人使用时,建议使用BBR_CAKE；

    && apt-get update -y
    && apt-get -y install vim dnsutils curl sudo openresolv net-tools lsb-release tar
    && curl -fsSL https://get.docker.com/ | sh || apt-get -y install docker.io
    && mkdir -p ~/netflix-proxy
    && cd ~/netflix-proxy
    && curl -fsSL https://raw.githubusercontent.com/urnuts/scripts/main/netflix/netflix-proxy-latest.tar.gz | gunzip - | tar x --strip-components=1
    && ./build.sh
    
    
    成功后显示登录地址：http://ip:8080, admin/密码
    可添加放行ipv4，或域名

    修改密码：服务器自动生成的密码很难记，而作者提供的改密码的方式有问题，这里提供大佬的方式
    # 进入文件目录##：cd  ~/netflix-proxy/auth/
    # 进入数据库##：sqlite3 ./db/auth.db
    # 修改密码后,可直接关闭ssh窗口##：update users set password='你的新密码' where id=1;
    
    
 二. 安装出错通常是因为依赖不完整,可删除后重装:
    
    查询运行的docker进程：docker ps -a
    停止运行进程：docker stop id
    删除运行进程：docker rm id
    删除文件夹及对应内容：rm -rf -/root/netflix-proxy


三.先于第一步修改默认dns:

    sudo systemctl stop systemd-resolved
    sudo systemctl disable systemd-resolved
    sudo rm -rf /etc/resolv.conf
        //删除后重新创建resolv.conf
    sudo touch /etc/resolv.conf
    echo nameserver 1.1.1.1 > /etc/resolv.conf
    echo nameserver 1.0.0.1 >> /etc/resolv.conf
    echo nameserver 8.8.8.8 >> /etc/resolv.conf
    
四. 客户机配置一键dnsmasq分流：

    wget https://raw.githubusercontent.com/urnuts/netflix.dnsmasq/master/unlock.sh && chmod +x unlock.sh &&  ./unlock.sh dnsip

