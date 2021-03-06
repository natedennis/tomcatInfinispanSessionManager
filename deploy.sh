#!/bin/bash
echo "deploy sessionManager"
DEV_PATH=/home/ext/devel/myProjects/tomcatInfinispanSessionManager
SUFFIX="HEAD"$1
#TOMCAT_PATH=/home/zvrablik/ismart/testLBTomcat
TOMCAT_PATH=~/ismart/ismart$SUFFIX


echo "devPath: $DEV_PATH"
echo "tomcatPath: $TOMCAT_PATH"

SESSION_MANAGER_VERSION=1.0.1.7.0.28-SNAPSHOT

cp $DEV_PATH/tomcatDistributedSessionManager/build/libs/tomcatDistributedSessionManager-$SESSION_MANAGER_VERSION.jar $TOMCAT_PATH/lib/tomcatDistributedSessionManager.jar
#don't use transaction manager yet
#cp $DEV_PATH/tomcatJBossTM/build/libs/tomcatJBossTM-.jar $TOMCAT_PATH/lib/jbossTM/tomcatJbossTM.jar
cp $DEV_PATH/memoryAgent/build/libs/memoryAgent-1.0-SNAPSHOT.jar $TOMCAT_PATH/lib/memoryAgent.jar
cp $DEV_PATH/testInfinispanCache/build/libs/testInfinispanCache-1.0-SNAPSHOT.jar $TOMCAT_PATH/lib/testInfinispanCache.jar
cp $DEV_PATH/testDbOracle/build/libs/testDbOracle-1.0-SNAPSHOT.jar $TOMCAT_PATH/lib/testDbOracle.jar

echo "deploy test app"
echo "remove old"
rm -rf $TOMCAT_PATH/webapps/testLB
rm -rf $TOMCAT_PATH/webapps/testLB2
echo "deploy"
cp $DEV_PATH/testLB/build/libs/testLB-1.0-SNAPSHOT.war $TOMCAT_PATH/webapps/testLB.war
cp $DEV_PATH/testLB/build/libs/testLB-1.0-SNAPSHOT.war $TOMCAT_PATH/webapps/testLB2.war
sleep 5
ls -la $TOMCAT_PATH/webapps/ |grep testLB
