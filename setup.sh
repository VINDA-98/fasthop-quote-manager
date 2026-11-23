#!/bin/bash
RED_COLOR='\E[1;31m'    #红
GREEN_COLOR='\E[1;32m'  #绿
YELOW_COLOR='\E[1;33m'  #黄
BLUE_COLOR='\E[1;34m' #蓝
PINK='\E[1;35m'      #粉红
RES='\E[0m'

echo -e "${GREEN_COLOR}****后台管理系统：开始执行自动化部署****${RES}\n\n"
echo -e "${YELOW_COLOR}---step1:合并代码---${RES}"
git pull origin main
echo -e "${BLUE_COLOR}合并代码成功${RES}\n"

echo -e "${YELOW_COLOR}---step2:编译---${RES}"
go build -o fasthop-quote-manager
echo -e "${BLUE_COLOR}编译完成${RES}\n"

echo -e "${YELOW_COLOR}---step3:更改权限---${RES}"
chmod -R 777 fasthop-quote-manager
echo -e "${BLUE_COLOR}更改权限完成${RES}\n"

echo -e "${YELOW_COLOR}---step4:杀掉进程并且运行---${RES}"
# Stop the active binary or the one used before the rename.
i1=$(ps -eo pid=,args= | awk '$2 == "./fasthop-quote-manager" || $2 == "./Fasthop" { print $1 }')
if [ -n "$i1" ]; then
    echo -e "${BLUE_COLOR}杀掉进程$i1${RES}\n"
    kill -9 $i1 || exit 1
fi
nohup ./fasthop-quote-manager >./out.log 2>&1 &
i2=$!
echo -e "${GREEN_COLOR}****部署成功,部署的进程ID为:$i2${RES}****"
