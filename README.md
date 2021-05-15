常用脚本汇总：


更新内核并开启bbr_fq：

    wget  --no-check-certificate https://raw.githubusercontent.com/urnuts/scripts/main/tcp.sh
    chmod +x tcp.sh && ./tcp.sh
    
    //原版：wget -O tcp.sh "https://git.io/coolspeeda/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
    
    
besttrace: TCP回程
    
    wget --no-check-certificate https://raw.githubusercontent.com/urnuts/scripts/main/tcptrace.sh
    chmod +x tcptrace.sh && ./tcptrace.sh
    
    测试具体ip:./besttrace -q1 -T -g cn ip
    
    

    
    

