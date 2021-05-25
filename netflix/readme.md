  
    ubuntu 18/20，无需更新内核，直接安装成功；
    多人使用时,建议使用BBR_CAKE；

    && apt-get update -y
    && apt-get -y install vim dnsutils curl sudo openresolv net-tools lsb-release tar
    && curl -fsSL https://get.docker.com/ | sh || apt-get -y install docker.io
    && mkdir -p ~/netflix-proxy
    && cd ~/netflix-proxy
    && curl -fsSL https://raw.githubusercontent.com/urnuts/scripts/main/netflix/netflix-proxy-latest.tar.gz | gunzip - | tar x --strip-components=1
    && ./build.sh
    
    
    安装出错通常是因为依赖不完整,可删除后重装:
    
    查询运行的docker进程：docker ps -a
    停止运行进程：docker stop id
    删除运行进程：docker rm id
    删除文件夹及对应内容：rm -rf -/root/netflix-proxy
