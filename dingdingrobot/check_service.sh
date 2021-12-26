#!/bin/bash

#CPU使用
CPU=`top -b -n 1| grep java| awk '{print ($9)}'`
#内存使用率
MEN=`top -b -n 1| grep java| awk '{print ($10)}'`
#CPU告警
if [ ${CPU%.*} -gt 20 ];then
    echo "警告！java进程CPU使用率已超过20%，此时占用率："${CPU}$"%，" >> /root/notepad/dingdingrobot/log.txt
    java -jar robot.jar
fi
#内存告警
if [ ${MEN%.*} -gt 2 ];then
    echo "警告！java进程内存使用率已超过2%，此时占用率："${MEN}$"%，" >> /root/notepad/dingdingrobot/log.txt
    java -jar robot.jar
fi
