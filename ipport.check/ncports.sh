
    #!/bin/bash  
    #检测服务器端口是否开放，成功会返回0值显示ok，失败会返回1值显示fail  
     
    cat /root/ip-ports.txt | while read line  
    do  
      nc -w 3 -z $line > /dev/null 2>&1  
      if [ $? -eq 0 ]  
      then  
        echo $line:ok  
      else  
        echo $line:fail  
      fi   
    done 
