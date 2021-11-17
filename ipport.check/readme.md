    批量检测IP:port连通性


    1. 按照IP port格式输入：
      1.1.1.1 443
      2.2.2.2 8888
    2. 把 ip-ports.txt和 .sh脚本放到root下，
    3. 运行：chmod a+x /root/ncports.sh && ./ncports.sh



    参考：https://www.cnblogs.com/shangzekai/p/4519919.html






或者命令端操作：

    1).创建ip文件： touch /root/ip-ports.txt
    2). 导入ip:port
    
      echo -e "global
       1.1.1.1 443
       6.6.6.6 666
       2.2.2.2 443 > /root/ip-ports.txt
    
    3). 创建命令文件：touch /root/ncports.sh
    输入命令：
    
    echo -e "global
      #!/bin/bash  
      #检测服务器端口是否开放，成功会返回0值显示ok，失败会返回1值显示fail  
           cat /root/ip-ports.txt | while read line  
      do  
        nc -w 10 -z $line > /dev/null 2>&1  
        if [ $? -eq 0 ]  
        then  
          echo $line:ok  
        else  
          echo $line:fail  
        fi   
      done  > /root/ncports.sh
      
    4).运行：chmod a+x /root/ncports.sh && ./ncports.sh
    

    
