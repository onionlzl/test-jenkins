#!/usr/bin/env bash
# 解决jenkins默认自动终止shell产生的进程问题
BUILD_ID=dontKillMe
cd target
# 先停掉旧服务
ps -ef | grep test-jenkins-1.0-SNAPSHOT.jar | grep -v grep | awk '{print "kill -15 "$2}' | sh
# 再运行新服务
BUILD_ID=dontKillMe nohup java -jar test-jenkins-1.0-SNAPSHOT.jar > app.log 2>&1 &